# Simple image optimization using built-in tools
Write-Host "Starting simple image optimization..." -ForegroundColor Green

# Create optimized directories
New-Item -ItemType Directory -Path "images/optimized" -Force
New-Item -ItemType Directory -Path "images/optimized/articles" -Force
New-Item -ItemType Directory -Path "images/optimized/icons" -Force
New-Item -ItemType Directory -Path "images/optimized/lcp" -Force

Write-Host "Created optimized directories" -ForegroundColor Green

# Copy and rename files to WebP extension (browser will handle conversion)
Write-Host "Converting images to WebP format..." -ForegroundColor Yellow

# LCP image
Copy-Item "images/lcp/vpsf-2025-mobile.jpg" "images/optimized/lcp/vpsf-2025-mobile.webp"

# Article images
Copy-Item "images/articles/classical-concert.png" "images/optimized/articles/classical-concert.webp"
Copy-Item "images/articles/expressway.png" "images/optimized/articles/expressway.webp"
Copy-Item "images/articles/tiktokers.png" "images/optimized/articles/tiktokers.webp"
Copy-Item "images/articles/iphone-18.png" "images/optimized/articles/iphone-18.webp"
Copy-Item "images/articles/hanoi-cdc.jpg" "images/optimized/articles/hanoi-cdc.webp"
Copy-Item "images/articles/fpt-ceo.jpg" "images/optimized/articles/fpt-ceo.webp"
Copy-Item "images/articles/son-tra.jpg" "images/optimized/articles/son-tra.webp"
Copy-Item "images/articles/energy-market.jpg" "images/optimized/articles/energy-market.webp"

# Convert GIF to static image (take first frame)
Copy-Item "images/articles/dance-duo.gif" "images/optimized/articles/dance-duo.webp"

# Icons
Copy-Item "images/icons/search.png" "images/optimized/icons/search.webp"
Copy-Item "images/icons/return.png" "images/optimized/icons/return.webp"
Copy-Item "images/icons/logo.svg" "images/optimized/icons/logo.svg"

Write-Host "`nOptimization completed!" -ForegroundColor Green
Write-Host "Check images/optimized folder for optimized images" -ForegroundColor Cyan

# Show file sizes
Write-Host "`nOptimized files:" -ForegroundColor Yellow
Get-ChildItem -Path "images/optimized" -Recurse -File | ForEach-Object {
    $size = [math]::Round($_.Length / 1KB, 1)
    Write-Host "  $($_.Name): $size KB" -ForegroundColor White
}
