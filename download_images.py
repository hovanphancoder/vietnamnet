#!/usr/bin/env python3
"""
Script to download and optimize images for Vietnamnet website
"""

import requests
import os
from urllib.parse import urlparse
from PIL import Image
import io

def create_directories():
    """Create necessary directories"""
    dirs = ['images/lcp', 'images/articles', 'images/icons']
    for dir_name in dirs:
        os.makedirs(dir_name, exist_ok=True)
    print("✅ Created directories")

def download_image(url, filename):
    """Download image from URL"""
    try:
        response = requests.get(url, timeout=30)
        response.raise_for_status()
        
        with open(filename, 'wb') as f:
            f.write(response.content)
        
        print(f"✅ Downloaded: {filename}")
        return True
    except Exception as e:
        print(f"❌ Failed to download {url}: {e}")
        return False

def optimize_image(input_path, output_path, quality=85, max_width=800):
    """Optimize image with WebP format"""
    try:
        with Image.open(input_path) as img:
            # Convert to RGB if necessary
            if img.mode in ('RGBA', 'LA', 'P'):
                img = img.convert('RGB')
            
            # Resize if too large
            if img.width > max_width:
                ratio = max_width / img.width
                new_height = int(img.height * ratio)
                img = img.resize((max_width, new_height), Image.Resampling.LANCZOS)
            
            # Save as WebP
            img.save(output_path, 'WebP', quality=quality, optimize=True)
        
        # Get file sizes
        original_size = os.path.getsize(input_path)
        optimized_size = os.path.getsize(output_path)
        savings = ((original_size - optimized_size) / original_size) * 100
        
        print(f"✅ Optimized: {output_path} (Saved {savings:.1f}%)")
        return True
    except Exception as e:
        print(f"❌ Failed to optimize {input_path}: {e}")
        return False

def main():
    """Main function"""
    print("🚀 Starting image download and optimization...")
    
    # Create directories
    create_directories()
    
    # Image URLs to download
    images = {
        # LCP Images
        'lcp/vpsf-2025-mobile.jpg': 'https://static-images.vnncdn.net/vps_images_publish/000001/00000Q/2025/9/16/vpsf-2025-reform-needed-to-protect-private-sector-from-legal-risks-e9f0329470194120914f703d526253f6-3124.jpg?width=360&s=YSvU9pNHOvvPWFhkZsrO4g',
        'lcp/vpsf-2025-tablet.jpg': 'https://static-images.vnncdn.net/vps_images_publish/000001/00000Q/2025/9/16/vpsf-2025-reform-needed-to-protect-private-sector-from-legal-risks-e9f0329470194120914f703d526253f6-3124.jpg?width=550&s=YSvU9pNHOvvPWFhkZsrO4g',
        'lcp/vpsf-2025-desktop.jpg': 'https://static-images.vnncdn.net/vps_images_publish/000001/00000Q/2025/9/16/vpsf-2025-reform-needed-to-protect-private-sector-from-legal-risks-e9f0329470194120914f703d526253f6-3124.jpg?width=800&s=YSvU9pNHOvvPWFhkZsrO4g',
        
        # Article Images
        'articles/classical-concert.jpg': 'https://static-images.vnncdn.net/vps_images_publish/000001/00000Q/2025/9/17/classical-stars-unite-for-vivaldi-beethoven-concert-in-hanoi-bb0763974f9c4f0daf96e7eb1665aba6-52.png?width=360&s=g-RuxjAOe5ay9qlQYhkzNA',
        'articles/dance-duo.jpg': 'https://static-images.vnncdn.net/vps_images_publish/000001/00000Q/2025/9/17/vietnamese-dance-duo-wins-world-bronze-in-latin-showdance-debut-f90b4100f4734b28a7bd6a64bd89b804-98.gif?width=360&s=R3gNXmh-f4G_2fNK9Yri_A',
        'articles/son-tra.jpg': 'https://static-images.vnncdn.net/vps_images_publish/000001/00000Q/2025/9/16/son-tra-peninsula-reopens-to-visitors-after-landslide-related-closure-9f817f4cece24dac82731fbdfdf47fee-3155.jpg?width=360&s=Vsw74mgQZoYOtfCB_fcoIQ',
        'articles/energy-market.jpg': 'https://static-images.vnncdn.net/vps_images_publish/000001/00000Q/2025/9/17/vietnam-to-reform-energy-market-for-fairness-innovation-and-security-c4ffadda7925445db63a637ddb6b18d6-63.jpg?width=360&s=QDoHcs_2scNw2jCoDK6QhA',
        'articles/tiktokers.jpg': 'https://static-images.vnncdn.net/vps_images_publish/000001/00000Q/2025/9/17/two-tiktokers-arrested-in-hcm-city-for-staging-offensive-livestreams-3b53f60a389a464aa7b50d307a31d81a-94.png?width=360&s=HzyBbElIc-cePtrOPTt0VQ',
        'articles/iphone-18.jpg': 'https://static-images.vnncdn.net/vps_images_publish/000001/00000Q/2025/9/16/iphone-18-rumors-point-to-slimmer-dynamic-island-not-under-display-face-id-bd447a73097246e587ddb895220b10d0-1351.png?width=360&s=s9mCvu2ANl4bdiUuSJ1mkg',
        'articles/expressway.jpg': 'https://static-images.vnncdn.net/vps_images_publish/000001/00000Q/2025/9/16/63-billion-proposed-to-widen-18-north-south-expressway-segments-4f4ac77654ae4d91aff82c39e5621652-3149.png?width=360&s=16x9sWRJH_f5qPmHMcS6VA',
        'articles/hanoi-cdc.jpg': 'https://static-images.vnncdn.net/vps_images_publish/000001/00000Q/2025/9/16/hanoi-cdc-shuts-fanpage-comments-amid-child-abuse-scandal-70a3b59bfac54a7d9ed02f03d302d1ce-3147.jpg?width=360&s=ZUQktaRVicGeRgG9jDgckg',
        'articles/fpt-ceo.jpg': 'https://static-images.vnncdn.net/vps_images_publish/000001/00000Q/2025/9/16/fpt-ceo-vietnamese-businesses-must-unite-to-succeed-af2be71520fb4280adcacdb5fb0639a0-3137.jpg?width=360&s=W4KZRT6rDusoQIi73OwVcg',
        
        # Icons
        'icons/search.png': 'https://static.vnncdn.net/v1/icon/search.png',
        'icons/return.png': 'https://static.vnncdn.net/v1/icon/return.png',
        'icons/logo.svg': 'https://static.vnncdn.net/v1/icon/VietnamNet-bridge-vien-trang.svg',
    }
    
    # Download and optimize images
    for local_path, url in images.items():
        full_path = f"images/{local_path}"
        
        # Download original
        if download_image(url, full_path):
            # Create WebP version
            webp_path = full_path.replace('.jpg', '.webp').replace('.png', '.webp').replace('.gif', '.webp')
            if not webp_path.endswith('.svg'):  # Skip SVG files
                optimize_image(full_path, webp_path, quality=85)
    
    print("\n🎉 Image download and optimization completed!")
    print("\n📁 Files created:")
    print("   - images/lcp/ (LCP images)")
    print("   - images/articles/ (Article images)")
    print("   - images/icons/ (Icon images)")

if __name__ == "__main__":
    main()
