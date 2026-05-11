# from PIL import Image
#
# def is_red(pixel):
#     """
#     Check if the pixel contains red by examining the red channel intensity.
#     A pixel is considered 'red' if the red component is higher than both
#     the green and blue components.
#     """
#     r, g, b = pixel[:3]  # Extract RGB values
#     if r == 0 and g == 0 and b == 0:
#         return 1
#     else:
#         return 0
#
#
# def process_image(input_image_path, output_file_path):
#     # Load the image
#     image = Image.open(input_image_path).convert("RGB")
#     width, height = image.size
#
#     # Prepare to store binary data for each pixel
#     binary_output = []
#
#     # Process each pixel
#     for y in range(height):
#         row = []
#         for x in range(width):
#             pixel = image.getpixel((x, y))
#             if is_red(pixel):
#                 row.append("1")
#             else:
#                 row.append("0")
#
#         # Add row binary data to the overall output
#         binary_output.extend(row)
#
#     # Convert binary data into hexadecimal format
#     hex_output = []
#     current_line = []
#     for i in range(0, len(binary_output), 8):
#         byte = binary_output[i:i+8]
#         hex_value = hex(int("".join(byte), 2))[2:].zfill(2)  # Convert to hex, remove "0x" prefix, pad to 2 characters
#         current_line.append(hex_value)
#
#         # Write a line if it reaches 256 values
#         if len(current_line) == 64:
#             hex_output.append(" ".join(current_line))
#             current_line = []
#
#     # Add any remaining values as a final line
#     if current_line:
#         hex_output.append(" ".join(current_line))
#
#     # Write the hexadecimal output to the file
#     with open(output_file_path, "w") as f:
#         for line in hex_output:
#             f.write(line + "\n")
#
# # Usage
# input_image_path = "resized_qr_image.png"  # Replace with your image path
# output_file_path = "output_hex.txt"   # Output file path for hex data
# process_image(input_image_path, output_file_path)

from PIL import Image

def is_red(pixel):
    """Returns 1 if the pixel has a red component, otherwise returns 0."""
    r, g, b = pixel[:3]  # ignore the alpha channel if present
    #return 1 if r > 0 and r > g and r > b else 0
    if r == 0 and g == 0 and b == 0:
         return 0
    else:
         return 1

def process_image(image_path):
    # Open the image
    image = Image.open(image_path).convert("RGB")
    width, height = image.size

    # Create a list to hold the binary values for each pixel
    binary_data = []

    # Process each pixel in the image
    for y in range(height):
        for x in range(width):
            pixel = image.getpixel((x, y))
            binary_data.append(is_red(pixel))

    # Process the binary data in chunks of 256 bits
    for i in range(0, len(binary_data), 256):
        chunk = binary_data[i:i + 256]

        # Ensure each line is exactly 256 bits (pad with 0s if the image is not divisible by 256)
        if len(chunk) < 256:
            chunk += [0] * (256 - len(chunk))

        # Convert the 256-bit binary chunk to a hexadecimal string
        hex_string = ''.join(f"{int(''.join(map(str, chunk[i:i+4])), 2):X}" for i in range(0, 256, 4))

        # Print the 64-byte hex string
        print(hex_string)

# Example usage
process_image("cat.png")

