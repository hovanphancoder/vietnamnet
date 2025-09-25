#!/usr/bin/env python3
"""
Script to update HTML with local images
"""

import re
import os

def update_html_with_local_images():
    """Update HTML file to use local images"""
    
    # Read current HTML
    with open('index.html', 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Image replacements
    replacements = {
        # LCP Image
        r'https://static-images\.vnncdn\.net/vps_images_publish/000001/00000Q/2025/9/16/vpsf-2025-reform-needed-to-protect-private-sector-from-legal-risks-e9f0329470194120914f703d526253f6-3124\.jpg\?width=550&s=YSvU9pNHOvvPWFhkZsrO4g': 'images/lcp/vpsf-2025-tablet.webp',
        r'https://static-images\.vnncdn\.net/vps_images_publish/000001/00000Q/2025/9/16/vpsf-2025-reform-needed-to-protect-private-sector-from-legal-risks-e9f0329470194120914f703d526253f6-3124\.jpg\?width=360&s=YSvU9pNHOvvPWFhkZsrO4g': 'images/lcp/vpsf-2025-mobile.webp',
        r'https://static-images\.vnncdn\.net/vps_images_publish/000001/00000Q/2025/9/16/vpsf-2025-reform-needed-to-protect-private-sector-from-legal-risks-e9f0329470194120914f703d526253f6-3124\.jpg\?width=800&s=YSvU9pNHOvvPWFhkZsrO4g': 'images/lcp/vpsf-2025-desktop.webp',
        
        # Article Images
        r'https://static-images\.vnncdn\.net/vps_images_publish/000001/00000Q/2025/9/17/classical-stars-unite-for-vivaldi-beethoven-concert-in-hanoi-bb0763974f9c4f0daf96e7eb1665aba6-52\.png\?width=360&s=g-RuxjAOe5ay9qlQYhkzNA': 'images/articles/classical-concert.webp',
        r'https://static-images\.vnncdn\.net/vps_images_publish/000001/00000Q/2025/9/17/vietnamese-dance-duo-wins-world-bronze-in-latin-showdance-debut-f90b4100f4734b28a7bd6a64bd89b804-98\.gif\?width=360&s=R3gNXmh-f4G_2fNK9Yri_A': 'images/articles/dance-duo.webp',
        r'https://static-images\.vnncdn\.net/vps_images_publish/000001/00000Q/2025/9/16/son-tra-peninsula-reopens-to-visitors-after-landslide-related-closure-9f817f4cece24dac82731fbdfdf47fee-3155\.jpg\?width=360&s=Vsw74mgQZoYOtfCB_fcoIQ': 'images/articles/son-tra.webp',
        r'https://static-images\.vnncdn\.net/vps_images_publish/000001/00000Q/2025/9/17/vietnam-to-reform-energy-market-for-fairness-innovation-and-security-c4ffadda7925445db63a637ddb6b18d6-63\.jpg\?width=360&s=QDoHcs_2scNw2jCoDK6QhA': 'images/articles/energy-market.webp',
        r'https://static-images\.vnncdn\.net/vps_images_publish/000001/00000Q/2025/9/17/two-tiktokers-arrested-in-hcm-city-for-staging-offensive-livestreams-3b53f60a389a464aa7b50d307a31d81a-94\.png\?width=360&s=HzyBbElIc-cePtrOPTt0VQ': 'images/articles/tiktokers.webp',
        r'https://static-images\.vnncdn\.net/vps_images_publish/000001/00000Q/2025/9/16/iphone-18-rumors-point-to-slimmer-dynamic-island-not-under-display-face-id-bd447a73097246e587ddb895220b10d0-1351\.png\?width=360&s=s9mCvu2ANl4bdiUuSJ1mkg': 'images/articles/iphone-18.webp',
        r'https://static-images\.vnncdn\.net/vps_images_publish/000001/00000Q/2025/9/16/63-billion-proposed-to-widen-18-north-south-expressway-segments-4f4ac77654ae4d91aff82c39e5621652-3149\.png\?width=360&s=16x9sWRJH_f5qPmHMcS6VA': 'images/articles/expressway.webp',
        r'https://static-images\.vnncdn\.net/vps_images_publish/000001/00000Q/2025/9/16/hanoi-cdc-shuts-fanpage-comments-amid-child-abuse-scandal-70a3b59bfac54a7d9ed02f03d302d1ce-3147\.jpg\?width=360&s=ZUQktaRVicGeRgG9jDgckg': 'images/articles/hanoi-cdc.webp',
        r'https://static-images\.vnncdn\.net/vps_images_publish/000001/00000Q/2025/9/16/fpt-ceo-vietnamese-businesses-must-unite-to-succeed-af2be71520fb4280adcacdb5fb0639a0-3137\.jpg\?width=360&s=W4KZRT6rDusoQIi73OwVcg': 'images/articles/fpt-ceo.webp',
        
        # Icons
        r'https://static\.vnncdn\.net/v1/icon/search\.png': 'images/icons/search.png',
        r'https://static\.vnncdn\.net/v1/icon/return\.png': 'images/icons/return.png',
        r'https://static\.vnncdn\.net/v1/icon/VietnamNet-bridge-vien-trang\.svg': 'images/icons/logo.svg',
    }
    
    # Apply replacements
    for pattern, replacement in replacements.items():
        content = re.sub(pattern, replacement, content)
    
    # Update preload links
    content = re.sub(
        r'<link rel="preload" as="image" href="https://static-images\.vnncdn\.net[^"]*" fetchpriority="high" crossorigin="anonymous">',
        '<link rel="preload" as="image" href="images/lcp/vpsf-2025-tablet.webp" fetchpriority="high">',
        content
    )
    
    content = re.sub(
        r'<link rel="preload" as="image" href="https://static-images\.vnncdn\.net[^"]*" media="\(min-width: 768px\)" fetchpriority="high" crossorigin="anonymous">',
        '<link rel="preload" as="image" href="images/lcp/vpsf-2025-desktop.webp" media="(min-width: 768px)" fetchpriority="high">',
        content
    )
    
    # Remove crossorigin from LCP image
    content = re.sub(
        r'crossorigin="anonymous"',
        '',
        content
    )
    
    # Write updated HTML
    with open('index.html', 'w', encoding='utf-8') as f:
        f.write(content)
    
    print("✅ HTML updated with local images!")
    print("✅ Removed crossorigin attributes")
    print("✅ Updated preload links")

if __name__ == "__main__":
    update_html_with_local_images()
