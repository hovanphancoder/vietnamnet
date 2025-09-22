#!/usr/bin/env python3
import os
import re

# List of HTML files to update
html_files = [
    'author.html',
    'category.html', 
    'single-author.html',
    'search.html',
    'single.html'
]

for filename in html_files:
    if not os.path.exists(filename):
        print(f"File {filename} not found, skipping...")
        continue
        
    print(f"Updating {filename}...")
    
    with open(filename, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Add CSS link after Font Awesome link
    pattern = r'(<link href="https://cdnjs\.cloudflare\.com/ajax/libs/font-awesome/6\.0\.0/css/all\.min\.css" rel="stylesheet">)'
    replacement = r'\1\n    <link href="css/style.css" rel="stylesheet">'
    
    if re.search(pattern, content):
        content = re.sub(pattern, replacement, content)
        
        # Write back to file
        with open(filename, 'w', encoding='utf-8') as f:
            f.write(content)
        
        print(f"Updated {filename}")
    else:
        print(f"Font Awesome link not found in {filename}")

print("All files updated successfully!")
