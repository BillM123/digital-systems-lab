from PIL import Image
import numpy as np

# Load image and convert to grayscale
image = Image.open("resized_qr_image.png").convert("L")  # "L" for grayscale

# Resize the image to fit your RAM size (e.g., 128x128 pixels)
# image = image.resize((128, 128))

# Convert the image data to a numpy array and flatten it
image_data = np.array(image).flatten()

# Convert each pixel to hexadecimal (8-bit for grayscale)
hex_data = [format(pixel, '02X') for pixel in image_data]

# Print or save the hex data for initializing the block RAM
print(hex_data)
