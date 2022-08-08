import wave, argparse, os

intensity = 0.25

low_val = round(128 - (128 * intensity))
high_val = round(128 + (128 * intensity))

SAMPLE_RATE = 9600
SPACE_FREQ = 1200
SPACE_CYCLES = 4
MARK_FREQ = 2400
MARK_CYCLES = 8


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


def generate_header(name: str, start_addr: int, end_addr: int) -> bytearray:
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
    print(f"Header checksum: 0x{checksum & 0xFF:02X}")
    result.extend(generate_byte(checksum & 0xFF))
    return result


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("in_file")
    parser.add_argument("out_file", nargs="?")
    parser.add_argument("speed", nargs="?", type=int)
    args = parser.parse_args()

    in_file = open(args.in_file, "rb")

    if not args.out_file:
        args.out_file = os.path.join(os.path.split(args.in_file)[0], os.path.split(args.in_file)[-1].split(".")[0] + ".wav")

    if not args.speed:
        args.speed = 1

    global MARK_CYCLES
    global SPACE_CYCLES
    if args.speed == 2:
        MARK_CYCLES = 4
        SPACE_CYCLES = 2
    
    if args.speed == 3:
        MARK_CYCLES = 2
        SPACE_CYCLES = 1

    print(f"Speed: {args.speed}")
    print(f"Output file: {args.out_file}")

    in_file.seek(0, 0)

    with wave.open(args.out_file, "wb") as file:
        file.setnchannels(1)
        file.setsampwidth(1)
        file.setframerate(SAMPLE_RATE)
        array = bytearray()
        array.extend(generate_leader(5))
        file_data = in_file.read()
        for byte in file_data:
            array.extend(generate_byte(byte))

        array.extend(generate_leader(5))
        file.writeframes(array)

    in_file.close()


if __name__ == "__main__":
    main()
