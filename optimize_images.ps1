# PowerShell script to optimize images
Write-Host "Starting image optimization..." -ForegroundColor Green

# Check if ImageMagick is available
$magick = Get-Command magick -ErrorAction SilentlyContinue
if (-not $magick) {
    Write-Host "ImageMagick not found. Installing via winget..." -ForegroundColor Yellow
    winget install ImageMagick.ImageMagick
}

# Function to optimize image
function Optimize-Image {
    param(
        [string]$InputPath,
        [string]$OutputPath,
        [int]$Width,
        [int]$Height,
        [int]$Quality = 85
    )
    
    try {
        # Resize and convert to WebP
        magick $InputPath -resize "${Width}x${Height}^" -gravity center -crop "${Width}x${Height}+0+0" -quality $Quality -format webp $OutputPath
        Write-Host "✅ Optimized: $OutputPath" -ForegroundColor Green
        return $true
    }
    catch {
        Write-Host "❌ Failed to optimize: $InputPath" -ForegroundColor Red
        return $false
    }
}

# Create optimized directories
New-Item -ItemType Directory -Path "images/optimized" -Force
New-Item -ItemType Directory -Path "images/optimized/articles" -Force
New-Item -ItemType Directory -Path "images/optimized/icons" -Force
New-Item -ItemType Directory -Path "images/optimized/lcp" -Force

Write-Host "Created optimized directories" -ForegroundColor Green

# Optimize LCP image (mobile size)
Optimize-Image -InputPath "images/lcp/vpsf-2025-mobile.jpg" -OutputPath "images/optimized/lcp/vpsf-2025-mobile.webp" -Width 165 -Height 86 -Quality 90

# Optimize article images (mobile size: 165x86)
Optimize-Image -InputPath "images/articles/classical-concert.png" -OutputPath "images/optimized/articles/classical-concert.webp" -Width 165 -Height 86 -Quality 85
Optimize-Image -InputPath "images/articles/expressway.png" -OutputPath "images/optimized/articles/expressway.webp" -Width 165 -Height 86 -Quality 85
Optimize-Image -InputPath "images/articles/tiktokers.png" -OutputPath "images/optimized/articles/tiktokers.webp" -Width 165 -Height 86 -Quality 85
Optimize-Image -InputPath "images/articles/iphone-18.png" -OutputPath "images/optimized/articles/iphone-18.webp" -Width 165 -Height 86 -Quality 85
Optimize-Image -InputPath "images/articles/hanoi-cdc.jpg" -OutputPath "images/optimized/articles/hanoi-cdc.webp" -Width 165 -Height 86 -Quality 85
Optimize-Image -InputPath "images/articles/fpt-ceo.jpg" -OutputPath "images/optimized/articles/fpt-ceo.webp" -Width 165 -Height 86 -Quality 85
Optimize-Image -InputPath "images/articles/son-tra.jpg" -OutputPath "images/optimized/articles/son-tra.webp" -Width 165 -Height 86 -Quality 85
Optimize-Image -InputPath "images/articles/energy-market.jpg" -OutputPath "images/optimized/articles/energy-market.webp" -Width 165 -Height 86 -Quality 85

# Convert GIF to WebP (static frame)
Optimize-Image -InputPath "images/articles/dance-duo.gif" -OutputPath "images/optimized/articles/dance-duo.webp" -Width 165 -Height 86 -Quality 85

# Optimize icons (20x20)
Optimize-Image -InputPath "images/icons/search.png" -OutputPath "images/optimized/icons/search.webp" -Width 20 -Height 20 -Quality 90

# Copy logo.svg as is (vector)
Copy-Item "images/icons/logo.svg" "images/optimized/icons/logo.svg"
Copy-Item "images/icons/return.png" "images/optimized/icons/return.png"

Write-Host "`nOptimization completed!" -ForegroundColor Green
Write-Host "Check images/optimized folder for optimized images" -ForegroundColor Cyan

# Show size comparison
Write-Host "`nSize comparison:" -ForegroundColor Yellow
Get-ChildItem -Path "images" -Recurse -File | Where-Object { $_.Extension -ne ".svg" } | ForEach-Object {
    $originalSize = $_.Length
    $optimizedPath = $_.FullName -replace "images", "images/optimized" -replace "\.(jpg|png|gif)$", ".webp"
    if (Test-Path $optimizedPath) {
        $optimizedSize = (Get-Item $optimizedPath).Length
        $savings = [math]::Round((($originalSize - $optimizedSize) / $originalSize) * 100, 1)
        Write-Host "  $($_.Name): $([math]::Round($originalSize/1KB, 1))KB → $([math]::Round($optimizedSize/1KB, 1))KB (Saved $savings%)" -ForegroundColor White
    }
}
