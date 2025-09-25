# PowerShell script to download and optimize images
Write-Host "🚀 Starting image download process..." -ForegroundColor Green

# Create directories
$directories = @("images/lcp", "images/articles", "images/icons")
foreach ($dir in $directories) {
    if (!(Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force
        Write-Host "✅ Created directory: $dir" -ForegroundColor Green
    }
}

# Image URLs and local paths
$images = @{
    # LCP Images
    "images/lcp/vpsf-2025-mobile.jpg" = "https://static-images.vnncdn.net/vps_images_publish/000001/00000Q/2025/9/16/vpsf-2025-reform-needed-to-protect-private-sector-from-legal-risks-e9f0329470194120914f703d526253f6-3124.jpg?width=360&s=YSvU9pNHOvvPWFhkZsrO4g"
    "images/lcp/vpsf-2025-tablet.jpg" = "https://static-images.vnncdn.net/vps_images_publish/000001/00000Q/2025/9/16/vpsf-2025-reform-needed-to-protect-private-sector-from-legal-risks-e9f0329470194120914f703d526253f6-3124.jpg?width=550&s=YSvU9pNHOvvPWFhkZsrO4g"
    "images/lcp/vpsf-2025-desktop.jpg" = "https://static-images.vnncdn.net/vps_images_publish/000001/00000Q/2025/9/16/vpsf-2025-reform-needed-to-protect-private-sector-from-legal-risks-e9f0329470194120914f703d526253f6-3124.jpg?width=800&s=YSvU9pNHOvvPWFhkZsrO4g"
    
    # Article Images
    "images/articles/classical-concert.jpg" = "https://static-images.vnncdn.net/vps_images_publish/000001/00000Q/2025/9/17/classical-stars-unite-for-vivaldi-beethoven-concert-in-hanoi-bb0763974f9c4f0daf96e7eb1665aba6-52.png?width=360&s=g-RuxjAOe5ay9qlQYhkzNA"
    "images/articles/dance-duo.jpg" = "https://static-images.vnncdn.net/vps_images_publish/000001/00000Q/2025/9/17/vietnamese-dance-duo-wins-world-bronze-in-latin-showdance-debut-f90b4100f4734b28a7bd6a64bd89b804-98.gif?width=360&s=R3gNXmh-f4G_2fNK9Yri_A"
    "images/articles/son-tra.jpg" = "https://static-images.vnncdn.net/vps_images_publish/000001/00000Q/2025/9/16/son-tra-peninsula-reopens-to-visitors-after-landslide-related-closure-9f817f4cece24dac82731fbdfdf47fee-3155.jpg?width=360&s=Vsw74mgQZoYOtfCB_fcoIQ"
    "images/articles/energy-market.jpg" = "https://static-images.vnncdn.net/vps_images_publish/000001/00000Q/2025/9/17/vietnam-to-reform-energy-market-for-fairness-innovation-and-security-c4ffadda7925445db63a637ddb6b18d6-63.jpg?width=360&s=QDoHcs_2scNw2jCoDK6QhA"
    "images/articles/tiktokers.jpg" = "https://static-images.vnncdn.net/vps_images_publish/000001/00000Q/2025/9/17/two-tiktokers-arrested-in-hcm-city-for-staging-offensive-livestreams-3b53f60a389a464aa7b50d307a31d81a-94.png?width=360&s=HzyBbElIc-cePtrOPTt0VQ"
    "images/articles/iphone-18.jpg" = "https://static-images.vnncdn.net/vps_images_publish/000001/00000Q/2025/9/16/iphone-18-rumors-point-to-slimmer-dynamic-island-not-under-display-face-id-bd447a73097246e587ddb895220b10d0-1351.png?width=360&s=s9mCvu2ANl4bdiUuSJ1mkg"
    "images/articles/expressway.jpg" = "https://static-images.vnncdn.net/vps_images_publish/000001/00000Q/2025/9/16/63-billion-proposed-to-widen-18-north-south-expressway-segments-4f4ac77654ae4d91aff82c39e5621652-3149.png?width=360&s=16x9sWRJH_f5qPmHMcS6VA"
    "images/articles/hanoi-cdc.jpg" = "https://static-images.vnncdn.net/vps_images_publish/000001/00000Q/2025/9/16/hanoi-cdc-shuts-fanpage-comments-amid-child-abuse-scandal-70a3b59bfac54a7d9ed02f03d302d1ce-3147.jpg?width=360&s=ZUQktaRVicGeRgG9jDgckg"
    "images/articles/fpt-ceo.jpg" = "https://static-images.vnncdn.net/vps_images_publish/000001/00000Q/2025/9/16/fpt-ceo-vietnamese-businesses-must-unite-to-succeed-af2be71520fb4280adcacdb5fb0639a0-3137.jpg?width=360&s=W4KZRT6rDusoQIi73OwVcg"
    
    # Icons
    "images/icons/search.png" = "https://static.vnncdn.net/v1/icon/search.png"
    "images/icons/return.png" = "https://static.vnncdn.net/v1/icon/return.png"
    "images/icons/logo.svg" = "https://static.vnncdn.net/v1/icon/VietnamNet-bridge-vien-trang.svg"
}

# Download images
Write-Host "`n📥 Downloading images..." -ForegroundColor Yellow
$successCount = 0
$totalCount = $images.Count

foreach ($localPath in $images.Keys) {
    $url = $images[$localPath]
    try {
        Write-Host "Downloading: $localPath" -ForegroundColor Cyan
        Invoke-WebRequest -Uri $url -OutFile $localPath -TimeoutSec 30
        $successCount++
        Write-Host "✅ Downloaded: $localPath" -ForegroundColor Green
    }
    catch {
        Write-Host "❌ Failed to download: $localPath" -ForegroundColor Red
        Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
    }
}

Write-Host "`n📊 Download Summary:" -ForegroundColor Yellow
Write-Host "✅ Successfully downloaded: $successCount/$totalCount images" -ForegroundColor Green

# List downloaded files
Write-Host "`nDownloaded files:" -ForegroundColor Yellow
Get-ChildItem -Path "images" -Recurse | ForEach-Object {
    $size = [math]::Round($_.Length / 1KB, 2)
    Write-Host "  $($_.FullName) ($size KB)" -ForegroundColor White
}

Write-Host "`nImage download completed!" -ForegroundColor Green
Write-Host "📁 Check the 'images' folder for downloaded images" -ForegroundColor Cyan
Write-Host "`nPress any key to continue..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
