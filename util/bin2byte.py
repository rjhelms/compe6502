import argparse, os

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("in_file")
    parser.add_argument("out_file", nargs="?")

    args = parser.parse_args()

    in_file = open(args.in_file, "rb")

    print(f"Output file: {args.out_file}")

    with open(args.out_file, "w") as file:
        file_data = in_file.read()
        byte_count = 0
        for byte in file_data:
            if byte_count == 0:
                file.write("        .byte ")
            file.write("$")
            file.write(format(byte, '02x'))
            byte_count += 1
            if byte_count == 12:
                file.write('\n')
                byte_count = 0
            else:
                file.write(', ')
    in_file.close()

if __name__ == "__main__":
    main()
