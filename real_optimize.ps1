# Real image optimization with correct dimensions
Write-Host "Starting real image optimization..." -ForegroundColor Green

# Create ultra-optimized directories
New-Item -ItemType Directory -Path "images/ultra-optimized" -Force
New-Item -ItemType Directory -Path "images/ultra-optimized/articles" -Force
New-Item -ItemType Directory -Path "images/ultra-optimized/icons" -Force
New-Item -ItemType Directory -Path "images/ultra-optimized/lcp" -Force

Write-Host "Created ultra-optimized directories" -ForegroundColor Green

# Function to create optimized image using .NET
function Create-OptimizedImage {
    param(
        [string]$InputPath,
        [string]$OutputPath,
        [int]$Width,
        [int]$Height,
        [int]$Quality = 80
    )
    
    try {
        # Load the image
        Add-Type -AssemblyName System.Drawing
        $originalImage = [System.Drawing.Image]::FromFile((Resolve-Path $InputPath))
        
        # Create new bitmap with correct dimensions
        $newImage = New-Object System.Drawing.Bitmap($Width, $Height)
        $graphics = [System.Drawing.Graphics]::FromImage($newImage)
        
        # Set high quality settings
        $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
        $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
        $graphics.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
        
        # Draw resized image
        $graphics.DrawImage($originalImage, 0, 0, $Width, $Height)
        
        # Save as JPEG with high compression
        $jpegCodec = [System.Drawing.Imaging.ImageCodecInfo]::GetImageDecoders() | Where-Object { $_.FormatID -eq [System.Drawing.Imaging.ImageFormat]::Jpeg.Guid }
        $encoderParams = New-Object System.Drawing.Imaging.EncoderParameters(1)
        $encoderParams.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter([System.Drawing.Imaging.Encoder]::Quality, $Quality)
        
        $newImage.Save($OutputPath, $jpegCodec, $encoderParams)
        
        # Cleanup
        $graphics.Dispose()
        $newImage.Dispose()
        $originalImage.Dispose()
        
        Write-Host "✅ Optimized: $OutputPath" -ForegroundColor Green
        return $true
    }
    catch {
        Write-Host "❌ Failed to optimize: $InputPath - $($_.Exception.Message)" -ForegroundColor Red
        return $false
    }
}

# Optimize LCP image (165x86 for mobile)
Create-OptimizedImage -InputPath "images/lcp/vpsf-2025-mobile.jpg" -OutputPath "images/ultra-optimized/lcp/vpsf-2025-mobile.jpg" -Width 165 -Height 86 -Quality 85

# Optimize article images (165x86 for mobile)
Create-OptimizedImage -InputPath "images/articles/classical-concert.png" -OutputPath "images/ultra-optimized/articles/classical-concert.jpg" -Width 165 -Height 86 -Quality 80
Create-OptimizedImage -InputPath "images/articles/expressway.png" -OutputPath "images/ultra-optimized/articles/expressway.jpg" -Width 165 -Height 86 -Quality 80
Create-OptimizedImage -InputPath "images/articles/tiktokers.png" -OutputPath "images/ultra-optimized/articles/tiktokers.jpg" -Width 165 -Height 86 -Quality 80
Create-OptimizedImage -InputPath "images/articles/iphone-18.png" -OutputPath "images/ultra-optimized/articles/iphone-18.jpg" -Width 165 -Height 86 -Quality 80
Create-OptimizedImage -InputPath "images/articles/hanoi-cdc.jpg" -OutputPath "images/ultra-optimized/articles/hanoi-cdc.jpg" -Width 165 -Height 86 -Quality 80
Create-OptimizedImage -InputPath "images/articles/fpt-ceo.jpg" -OutputPath "images/ultra-optimized/articles/fpt-ceo.jpg" -Width 165 -Height 86 -Quality 80
Create-OptimizedImage -InputPath "images/articles/son-tra.jpg" -OutputPath "images/ultra-optimized/articles/son-tra.jpg" -Width 165 -Height 86 -Quality 80
Create-OptimizedImage -InputPath "images/articles/energy-market.jpg" -OutputPath "images/ultra-optimized/articles/energy-market.jpg" -Width 165 -Height 86 -Quality 80

# Convert GIF to static JPEG (first frame only)
Create-OptimizedImage -InputPath "images/articles/dance-duo.gif" -OutputPath "images/ultra-optimized/articles/dance-duo.jpg" -Width 165 -Height 86 -Quality 75

# Optimize icons (20x20)
Create-OptimizedImage -InputPath "images/icons/search.png" -OutputPath "images/ultra-optimized/icons/search.jpg" -Width 20 -Height 20 -Quality 90
Create-OptimizedImage -InputPath "images/icons/return.png" -OutputPath "images/ultra-optimized/icons/return.jpg" -Width 20 -Height 20 -Quality 90

# Copy logo.svg as is (vector)
Copy-Item "images/icons/logo.svg" "images/ultra-optimized/icons/logo.svg"

Write-Host "`nUltra optimization completed!" -ForegroundColor Green
Write-Host "Check images/ultra-optimized folder for optimized images" -ForegroundColor Cyan

# Show size comparison
Write-Host "`nSize comparison:" -ForegroundColor Yellow
Get-ChildItem -Path "images/ultra-optimized" -Recurse -File | ForEach-Object {
    $size = [math]::Round($_.Length / 1KB, 1)
    Write-Host "  $($_.Name): $size KB" -ForegroundColor White
}
