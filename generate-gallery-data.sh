#!/bin/bash

# Script to generate gallery data from folder structure
# This creates a JSON file that Hugo can use to build the gallery

SHOTS_DIR="static/img/shots"
OUTPUT_FILE="data/gallery-dynamic.json"

# Start JSON structure
echo "{" > "$OUTPUT_FILE"
echo '  "categories": [' >> "$OUTPUT_FILE"

first_category=true

# Loop through each subdirectory in shots/
for category_dir in "$SHOTS_DIR"/*/ ; do
    if [ -d "$category_dir" ]; then
        category_name=$(basename "$category_dir")
        
        # Add comma before category (except first one)
        if [ "$first_category" = false ]; then
            echo "    }," >> "$OUTPUT_FILE"
        fi
        first_category=false
        
        # Start category object
        echo "    {" >> "$OUTPUT_FILE"
        echo "      \"name\": \"$category_name\"," >> "$OUTPUT_FILE"
        echo "      \"slug\": \"$(echo "$category_name" | tr '[:upper:] &' '[:lower:]--' | sed 's/--*/-/g')\"," >> "$OUTPUT_FILE"
        echo "      \"images\": [" >> "$OUTPUT_FILE"
        
        first_image=true
        
        # Loop through images in category
        for image in "$category_dir"*.{jpg,jpeg,png,JPG,JPEG,PNG} ; do
            if [ -f "$image" ]; then
                image_name=$(basename "$image")
                image_path="img/shots/$category_name/$image_name"
                
                # Add comma before image (except first one)
                if [ "$first_image" = false ]; then
                    echo "," >> "$OUTPUT_FILE"
                fi
                first_image=false
                
                # Add image object (no newline at end)
                echo -n "        {" >> "$OUTPUT_FILE"
                echo -n "\"src\": \"$image_path\", " >> "$OUTPUT_FILE"
                echo -n "\"alt\": \"$category_name - $image_name\"" >> "$OUTPUT_FILE"
                echo -n "}" >> "$OUTPUT_FILE"
            fi
        done
        
        # Close images array
        echo "" >> "$OUTPUT_FILE"
        echo "      ]" >> "$OUTPUT_FILE"
    fi
done

# Close last category and categories array
echo "    }" >> "$OUTPUT_FILE"
echo "  ]" >> "$OUTPUT_FILE"
echo "}" >> "$OUTPUT_FILE"

echo "Gallery data generated at $OUTPUT_FILE"

