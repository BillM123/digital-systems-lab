from PIL import Image

# Load the original QR code image
input_path = 'input_image.png'  # Replace with the path to your QR code image
qr_image = Image.open(input_path)

# Resize the QR code to 96x96 pixels
resized_qr_image = qr_image.resize((96, 96), Image.Resampling.NEAREST)

# Create a new blank white image of size 128x96
output_image = Image.new("RGB", (128, 96), "white")

# Paste the resized QR code (96x96) into the center of the 128x96 white background
output_image.paste(resized_qr_image, ((128 - 96) // 2, 0))

# Save the final image
output_path = 'resized_qr_image.png'  # Replace with your desired output path
output_image.save(output_path)

print(f"QR code resized and padded image saved to {output_path}")
