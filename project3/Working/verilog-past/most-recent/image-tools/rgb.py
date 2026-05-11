from PIL import Image

def pixel_value(image_path):
    # Open the image file
    with Image.open(image_path).convert("RGB") as img:
        # Get the width and height of the image
        w, h = img.size

        # Iterate over each pixel in the image
        for x in range(w):
            for y in range(h):
                # Get the RGB values of the current pixel
                r, g, b = img.getpixel((x, y))

                # Check if the pixel is black (i.e., all three color channels are 0)
                if r == 0 and g == 0 and b == 0:
                    print(1)  # Output 1 for a black pixel
                else:
                    print(0)  # Output 0 for any other pixel

# Specify the path to your PNG image file here
image_path = 'input_image.png'
pixel_value(image_path)

#from PIL import Image

#def pixel_value(image_path):
#    # Open the image file in RGB mode, defaulting to RGBA if needed for transparency support
#    img = Image.open(image_path).convert('RGB')
#    
#    # Get the width of the image
#    w = img.size[0]
#    
#    # Calculate how many lines we need based on 64 characters per line and padding with zeros
#    num_lines = -(-w // 64)  # Ceiling division
#    
#    # Iterate over each pixel in the image, grouped by 64 pixels per line
#    for y in range(img.size[1]):
#        line = ''
#        
#        # Process every group of 64 pixels (or less if we're near the end)
#        for x_start in range(0, w, num_lines):
#            x_end = min(x_start + num_lines, w)  # Ensure we don't go out of bounds
#            
#            # Iterate over each pixel within this line
#            for x in range(x_start, x_end):
#                # Get the RGB values of the current pixel and convert to hex
#                r, g, b = img.getpixel((x, y))
#                
#                # Convert color channel values (0-255) to two-digit hexadecimal strings padded with zeros if necessary
#                line += f'{r:02X}{g:02X}{b:02X} '
#            
#            print(line.strip())  # Print the current line
#
## Specify the path to your PNG image file here
#image_path = 'input_image.png'
#pixel_value(image_path)