#!/bin/bash

# Check if input file is provided as argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <input.json>"
    exit 1
fi

input_json="$1"

# Check if input file exists
if [ ! -f "$input_json" ]; then
    echo "Error: Input file '$input_json' not found."
    exit 1
fi

# Convert JSON to XML
xml_content=$(jq -cM '.' "$input_json" | xmlstarlet format -q)

# Write XML content to output file
output_xml="${input_json%.*}.xml"
echo "$xml_content" > "$output_xml"

echo "Conversion completed. XML saved to '$output_xml'."
