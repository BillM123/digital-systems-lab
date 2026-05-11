# # Convert binary image data into RAMB18E1 .INIT and .INITP format
# # Initialize empty lists to store the INIT and INITP values in hexadecimal
#
# init_data = []
# for row in bw_array:
#     # Convert each row of 128 bits to hexadecimal
#     row_str = ''.join(str(int(pixel)) for pixel in row)  # Convert row to a binary string
#     row_hex = hex(int(row_str, 2))[2:].zfill(32)  # Convert binary string to hex and pad to 32 characters
#     init_data.append(row_hex.upper())
#
# # Divide the INIT data into .INIT_XX format strings, 256 bits each
# init_dict = {}
# for i in range(0, len(init_data), 8):  # 8 rows of 128 bits fit into 1 INIT_xx entry (256 bytes)
#     init_val = ''.join(init_data[i:i + 8])  # Concatenate 8 rows of 128 bits each to get 256 bits
#     init_key = f"INIT_{i // 8:02X}"  # Create the INIT key with hex indexing
#     init_dict[init_key] = f"256'h{init_val}"
#
# # Prepare the INITP values as well (though INITP is typically for parity bits in RAMB18E1)
# # Given there are no parity bits for this image, INITP can remain zeroed.
# initp_dict = {f"INITP_{i:02X}": "256'h" + "0" * 64 for i in range(8)}
#
# # Display the INIT and INITP values for integration
# init_dict, initp_dict


from PIL import Image
import numpy as np

def image_to_ramb18e1_init(image_path, output_file="ramb18e1_init.coe"):
    # Load and resize the image to 128x96 for VGA display
    image = Image.open(image_path)
    image = image.convert('1')  # Convert to 1-bit monochrome (black & white)
    #image = image.resize((128, 96), Image.LANCZOS)

    # Convert image data to a 2D numpy array (1 for white, 0 for black)
    data = np.array(image)
    data = (data == 0).astype(np.uint8)  # Flip values to 1 for black, 0 for white if needed

    # Flatten the 2D array into a 1D array of bytes
    flat_data = data.flatten()

    # RAMB18E1 memory initialization settings
    # RAMB18E1 has 8 INITP blocks (1-bit each) and 64 INIT blocks (8-bits each)
    # Each INIT or INITP block has 256 bits (32 bytes or 256 / 8 bits)
    initp_blocks = [0] * 8
    init_blocks = [0] * 64

    # Populate INIT and INITP blocks with image data
    for i, bit in enumerate(flat_data):
        byte_index = i // 8
        bit_index = i % 8
        init_blocks[byte_index // 32] |= (bit << bit_index)

    # Convert INIT and INITP blocks to hexadecimal format
    initp_hex = ["{:032X}".format(initp) for initp in initp_blocks]
    init_hex = ["{:064X}".format(init) for init in init_blocks]

    # Write the output to a .coe file or directly as verilog parameters
    with open(output_file, "w") as f:
        f.write("// Memory Initialization File for RAMB18E1\n")
        for i, val in enumerate(initp_hex):
            f.write(f"INITP_{i:02X} = 256'h{val};\n")
        for i, val in enumerate(init_hex):
            f.write(f"INIT_{i:02X} = 256'h{val};\n")

    print(f"Memory initialization file '{output_file}' generated successfully.")

# Example usage
image_to_ramb18e1_init("input_image.png")
