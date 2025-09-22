#!/usr/bin/env python3
import os
import re

# Read the header and footer from index.html
with open('index.html', 'r', encoding='utf-8') as f:
    index_content = f.read()

# Extract header (from <!DOCTYPE html> to </header>)
header_match = re.search(r'<!DOCTYPE html>.*?</header>', index_content, re.DOTALL)
if header_match:
    new_header = header_match.group(0)
else:
    print("Could not extract header from index.html")
    exit(1)

# Extract footer (from <!-- Footer --> to </footer>)
footer_match = re.search(r'<!-- Footer -->.*?</footer>', index_content, re.DOTALL)
if footer_match:
    new_footer = footer_match.group(0)
else:
    print("Could not extract footer from index.html")
    exit(1)

# List of HTML files to update (excluding index.html)
html_files = [
    'single-author.html',
    'search.html', 
    'category.html',
    'single.html',
    'single-video.html',
    'video.html',
    'postcast.html',
    'multimedia.html',
    'news_register.html',
    'chitiethoso.html'
]

for filename in html_files:
    if not os.path.exists(filename):
        print(f"File {filename} not found, skipping...")
        continue
        
    print(f"Updating {filename}...")
    
    with open(filename, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Replace header
    header_pattern = r'<!DOCTYPE html>.*?</header>'
    content = re.sub(header_pattern, new_header, content, flags=re.DOTALL)
    
    # Replace footer
    footer_pattern = r'<!-- Footer -->.*?</footer>'
    content = re.sub(footer_pattern, new_footer, content, flags=re.DOTALL)
    
    # Write back to file
    with open(filename, 'w', encoding='utf-8') as f:
        f.write(content)
    
    print(f"Updated {filename}")

print("All files updated successfully!")
