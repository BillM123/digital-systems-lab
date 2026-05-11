from PIL import Image

def is_red(pixel):
    """
    Check if the pixel contains red by examining the red channel intensity.
    A pixel is considered 'red' if the red component is higher than both
    the green and blue components.
    """
    r, g, b = pixel[:3]  # Extract RGB values
    if r == 0 and g == 0 and b == 0:
        return 1
    else:
        return 0

def process_image_for_verilog(input_image_path, output_file_path):
    # Load the image
    image = Image.open(input_image_path).convert("RGB")
    width, height = image.size

    # Prepare to store binary data for each pixel
    binary_output = []

    # Process each pixel
    for y in range(height):
        row = []
        for x in range(width):
            pixel = image.getpixel((x, y))
            if is_red(pixel):
                row.append("1")
            else:
                row.append("0")

        # Add row binary data to the overall output
        binary_output.extend(row)

    # Convert binary data into 256-bit (64 hex characters) format for each INIT line
    verilog_init_lines = []
    current_line = []
    for i in range(0, len(binary_output), 256):  # 256 bits == 64 hex characters
        segment = binary_output[i:i+256]

        # Pad the segment if it's less than 256 bits (last segment, possibly)
        if len(segment) < 256:
            segment += ['0'] * (256 - len(segment))

        hex_value = hex(int("".join(segment), 2))[2:].zfill(64)  # Convert to hex, pad to 64 chars
        verilog_init_lines.append(f"256'h{hex_value}")

    # Write the Verilog-style INIT lines to the output file
    with open(output_file_path, "w") as f:
        for idx, line in enumerate(verilog_init_lines):
            init_name = f"INIT_{idx:02X}"
            f.write(f".{init_name}({line}),\n")

# Usage
input_image_path = "input_image.png"  # Replace with your image path
output_file_path = "output_verilog.txt"   # Output file path for Verilog INIT data
process_image_for_verilog(input_image_path, output_file_path)
