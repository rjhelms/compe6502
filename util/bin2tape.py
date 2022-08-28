import wave, argparse, os

intensity = 0.25

low_val = round(128 - (128 * intensity))
high_val = round(128 + (128 * intensity))

SAMPLE_RATE = 9600
SPACE_FREQ = 1200
SPACE_CYCLES = 2
MARK_FREQ = 2400
MARK_CYCLES = 4

SLOW_SPEED = 0xA3
FAST_SPEED = 0x4D

def generate_cycle(frequency: int) -> bytearray:
    """Generates one wave cycle at the specified frequency"""
    result = bytearray()
    cycle_length = SAMPLE_RATE / frequency
    for _ in range(round(cycle_length / 2)):
        result.append(high_val)
    for _ in range(round(cycle_length / 2)):
        result.append(low_val)

    return result


def generate_bit(value: bool) -> bytearray:
    """Generates one bit worth of KCS data"""
    result = bytearray()
    freq = SPACE_FREQ
    cycles = SPACE_CYCLES
    if value:
        freq = MARK_FREQ
        cycles = MARK_CYCLES
    for _ in range(cycles):
        result.extend(generate_cycle(freq))

    return result


def generate_byte(value: int) -> bytearray:
    """Generates one byte of KCS data"""
    result = bytearray()
    # start bit
    result.extend(generate_bit(0))

    # bits, from lsb to msb
    for _ in range(8):
        result.extend(generate_bit(value & 1))
        value = value >> 1

    # two stop bits
    result.extend(generate_bit(1))
    result.extend(generate_bit(1))

    return result


def generate_leader(duration: float) -> bytearray:
    """Generates a leader of MARK frequency for the requested duration"""
    result = bytearray()
    cycles = round(duration * MARK_FREQ)
    for _ in range(cycles):
        result.extend(generate_cycle(MARK_FREQ))

    return result


def generate_header(name: str, start_addr: int, 
                    end_addr: int, verbose: bool, slow: bool) -> bytearray:
    """Generates a tape header with the specified file name

    Tape header consists of bytes 0x09 to 0x00 in descending order, then the
    file name padded to 8 bytes with 0x00."""

    checksum = 0
    result = bytearray()
    for i in range(10, 0, -1):
        result.extend(generate_byte(i - 1))
        checksum += i - 1

    if len(name) > 8:
        name = name[:8]

    for i in range(8):
        if len(name) > i:
            to_write = ord(name[i])
            result.extend(generate_byte(to_write))
            checksum += to_write
        else:
            result.extend(generate_byte(0))

    result.extend(generate_byte(start_addr & 0xFF))
    checksum += start_addr & 0xFF
    result.extend(generate_byte(start_addr >> 8))
    checksum += start_addr >> 8
    result.extend(generate_byte(end_addr & 0xFF))
    checksum += end_addr & 0xFF
    result.extend(generate_byte(end_addr >> 8))
    checksum += end_addr >> 8

    if slow:
        result.extend(generate_byte(SLOW_SPEED))
        checksum += SLOW_SPEED
    else:
        result.extend(generate_byte(FAST_SPEED))
        checksum += FAST_SPEED

    if verbose:
        print(f"Header checksum: 0x{checksum & 0xFF:02X}")

    result.extend(generate_byte(checksum & 0xFF))
    return result


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("in_file")
    parser.add_argument("start_address")
    parser.add_argument("out_file", nargs="?")
    parser.add_argument("--slow", action="store_true")
    parser.add_argument("--name", nargs="?")
    parser.add_argument("--verbose", action="store_true")
    args = parser.parse_args()

    in_file = open(args.in_file, "rb")
    name = ""

    if not args.name:
        args.name = os.path.split(args.in_file)[-1].split(".")[0]

    if args.verbose:
        print(f"Generating {args.name}")

    if not args.out_file:
        args.out_file = os.path.join(os.path.split(args.in_file)[0], args.name + ".wav")

    if args.verbose:
        print(f"Output file: {args.out_file}")
    start_addr = int(args.start_address, 16)

    in_file.seek(0, os.SEEK_END)
    end_addr = in_file.tell() + start_addr
    in_file.seek(0, 0)

    if args.verbose:
        print(f"Start: 0x{start_addr:04X}, End: 0x{end_addr:04X}")
    with wave.open(args.out_file, "wb") as file:
        file.setnchannels(1)
        file.setsampwidth(1)
        file.setframerate(SAMPLE_RATE)
        array = bytearray()
        array.extend(generate_leader(5))
        array.extend(generate_header(args.name, start_addr, end_addr, args.verbose, args.slow))
        array.extend(generate_leader(1))

        global MARK_CYCLES
        global SPACE_CYCLES

        if not args.slow:
            MARK_CYCLES = 2
            SPACE_CYCLES = 1

        file_data = in_file.read()
        checksum = 0
        i = 0
        for byte in file_data:
            array.extend(generate_byte(byte))
            checksum += byte
            i += 1
            if i % 256 == 0:
                array.extend(generate_leader(0.1))
                array.extend(generate_byte(checksum & 0xFF))
                if args.verbose:
                    print(f" Block checksum: 0x{checksum & 0xFF:02X}")
                array.extend(generate_leader(0.1))

        array.extend(generate_byte(checksum & 0xFF))
        if args.verbose:
            print(f"  Data checksum: 0x{checksum & 0xFF:02X}")
        array.extend(generate_leader(5))
        file.writeframes(array)

    in_file.close()


if __name__ == "__main__":
    main()
