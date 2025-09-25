# Simple PowerShell script to download images
Write-Host "Starting image download..." -ForegroundColor Green

# Create directories
New-Item -ItemType Directory -Path "images/lcp" -Force
New-Item -ItemType Directory -Path "images/articles" -Force  
New-Item -ItemType Directory -Path "images/icons" -Force

Write-Host "Created directories" -ForegroundColor Green

# Download LCP images
Write-Host "Downloading LCP images..." -ForegroundColor Yellow
Invoke-WebRequest -Uri "https://static-images.vnncdn.net/vps_images_publish/000001/00000Q/2025/9/16/vpsf-2025-reform-needed-to-protect-private-sector-from-legal-risks-e9f0329470194120914f703d526253f6-3124.jpg?width=360&s=YSvU9pNHOvvPWFhkZsrO4g" -OutFile "images/lcp/vpsf-2025-mobile.jpg"
Invoke-WebRequest -Uri "https://static-images.vnncdn.net/vps_images_publish/000001/00000Q/2025/9/16/vpsf-2025-reform-needed-to-protect-private-sector-from-legal-risks-e9f0329470194120914f703d526253f6-3124.jpg?width=550&s=YSvU9pNHOvvPWFhkZsrO4g" -OutFile "images/lcp/vpsf-2025-tablet.jpg"
Invoke-WebRequest -Uri "https://static-images.vnncdn.net/vps_images_publish/000001/00000Q/2025/9/16/vpsf-2025-reform-needed-to-protect-private-sector-from-legal-risks-e9f0329470194120914f703d526253f6-3124.jpg?width=800&s=YSvU9pNHOvvPWFhkZsrO4g" -OutFile "images/lcp/vpsf-2025-desktop.jpg"

# Download article images
Write-Host "Downloading article images..." -ForegroundColor Yellow
Invoke-WebRequest -Uri "https://static-images.vnncdn.net/vps_images_publish/000001/00000Q/2025/9/17/classical-stars-unite-for-vivaldi-beethoven-concert-in-hanoi-bb0763974f9c4f0daf96e7eb1665aba6-52.png?width=360&s=g-RuxjAOe5ay9qlQYhkzNA" -OutFile "images/articles/classical-concert.png"
Invoke-WebRequest -Uri "https://static-images.vnncdn.net/vps_images_publish/000001/00000Q/2025/9/17/vietnamese-dance-duo-wins-world-bronze-in-latin-showdance-debut-f90b4100f4734b28a7bd6a64bd89b804-98.gif?width=360&s=R3gNXmh-f4G_2fNK9Yri_A" -OutFile "images/articles/dance-duo.gif"
Invoke-WebRequest -Uri "https://static-images.vnncdn.net/vps_images_publish/000001/00000Q/2025/9/16/son-tra-peninsula-reopens-to-visitors-after-landslide-related-closure-9f817f4cece24dac82731fbdfdf47fee-3155.jpg?width=360&s=Vsw74mgQZoYOtfCB_fcoIQ" -OutFile "images/articles/son-tra.jpg"
Invoke-WebRequest -Uri "https://static-images.vnncdn.net/vps_images_publish/000001/00000Q/2025/9/17/vietnam-to-reform-energy-market-for-fairness-innovation-and-security-c4ffadda7925445db63a637ddb6b18d6-63.jpg?width=360&s=QDoHcs_2scNw2jCoDK6QhA" -OutFile "images/articles/energy-market.jpg"
Invoke-WebRequest -Uri "https://static-images.vnncdn.net/vps_images_publish/000001/00000Q/2025/9/17/two-tiktokers-arrested-in-hcm-city-for-staging-offensive-livestreams-3b53f60a389a464aa7b50d307a31d81a-94.png?width=360&s=HzyBbElIc-cePtrOPTt0VQ" -OutFile "images/articles/tiktokers.png"
Invoke-WebRequest -Uri "https://static-images.vnncdn.net/vps_images_publish/000001/00000Q/2025/9/16/iphone-18-rumors-point-to-slimmer-dynamic-island-not-under-display-face-id-bd447a73097246e587ddb895220b10d0-1351.png?width=360&s=s9mCvu2ANl4bdiUuSJ1mkg" -OutFile "images/articles/iphone-18.png"
Invoke-WebRequest -Uri "https://static-images.vnncdn.net/vps_images_publish/000001/00000Q/2025/9/16/63-billion-proposed-to-widen-18-north-south-expressway-segments-4f4ac77654ae4d91aff82c39e5621652-3149.png?width=360&s=16x9sWRJH_f5qPmHMcS6VA" -OutFile "images/articles/expressway.png"
Invoke-WebRequest -Uri "https://static-images.vnncdn.net/vps_images_publish/000001/00000Q/2025/9/16/hanoi-cdc-shuts-fanpage-comments-amid-child-abuse-scandal-70a3b59bfac54a7d9ed02f03d302d1ce-3147.jpg?width=360&s=ZUQktaRVicGeRgG9jDgckg" -OutFile "images/articles/hanoi-cdc.jpg"
Invoke-WebRequest -Uri "https://static-images.vnncdn.net/vps_images_publish/000001/00000Q/2025/9/16/fpt-ceo-vietnamese-businesses-must-unite-to-succeed-af2be71520fb4280adcacdb5fb0639a0-3137.jpg?width=360&s=W4KZRT6rDusoQIi73OwVcg" -OutFile "images/articles/fpt-ceo.jpg"

# Download icons
Write-Host "Downloading icons..." -ForegroundColor Yellow
Invoke-WebRequest -Uri "https://static.vnncdn.net/v1/icon/search.png" -OutFile "images/icons/search.png"
Invoke-WebRequest -Uri "https://static.vnncdn.net/v1/icon/return.png" -OutFile "images/icons/return.png"
Invoke-WebRequest -Uri "https://static.vnncdn.net/v1/icon/VietnamNet-bridge-vien-trang.svg" -OutFile "images/icons/logo.svg"

Write-Host "Download completed!" -ForegroundColor Green
Write-Host "Check images folder for downloaded files" -ForegroundColor Cyan
