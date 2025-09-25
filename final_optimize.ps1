# Final image optimization with correct dimensions
Write-Host "Starting final image optimization..." -ForegroundColor Green

# Create final optimized directories
New-Item -ItemType Directory -Path "images/final-optimized" -Force
New-Item -ItemType Directory -Path "images/final-optimized/articles" -Force
New-Item -ItemType Directory -Path "images/final-optimized/icons" -Force
New-Item -ItemType Directory -Path "images/final-optimized/lcp" -Force

Write-Host "Created final optimized directories" -ForegroundColor Green

# Function to create properly sized images
function Create-FinalImage {
    param(
        [string]$InputPath,
        [string]$OutputPath,
        [int]$Width,
        [int]$Height,
        [int]$Quality = 75
    )
    
    try {
        # Load the image
        Add-Type -AssemblyName System.Drawing
        $originalImage = [System.Drawing.Image]::FromFile((Resolve-Path $InputPath))
        
        # Create new bitmap with exact dimensions
        $newImage = New-Object System.Drawing.Bitmap($Width, $Height)
        $graphics = [System.Drawing.Graphics]::FromImage($newImage)
        
        # Set high quality settings
        $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
        $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
        $graphics.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
        $graphics.CompositingQuality = [System.Drawing.Drawing2D.CompositingQuality]::HighQuality
        
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
        
        Write-Host "✅ Created: $OutputPath ($Width x $Height)" -ForegroundColor Green
        return $true
    }
    catch {
        Write-Host "❌ Failed: $InputPath - $($_.Exception.Message)" -ForegroundColor Red
        return $false
    }
}

# Optimize LCP image (165x86 for mobile)
Create-FinalImage -InputPath "images/lcp/vpsf-2025-mobile.jpg" -OutputPath "images/final-optimized/lcp/vpsf-2025-mobile.jpg" -Width 165 -Height 86 -Quality 80

# Optimize article images (165x86 for mobile)
Create-FinalImage -InputPath "images/articles/classical-concert.png" -OutputPath "images/final-optimized/articles/classical-concert.jpg" -Width 165 -Height 86 -Quality 75
Create-FinalImage -InputPath "images/articles/expressway.png" -OutputPath "images/final-optimized/articles/expressway.jpg" -Width 165 -Height 86 -Quality 75
Create-FinalImage -InputPath "images/articles/tiktokers.png" -OutputPath "images/final-optimized/articles/tiktokers.jpg" -Width 165 -Height 86 -Quality 75
Create-FinalImage -InputPath "images/articles/iphone-18.png" -OutputPath "images/final-optimized/articles/iphone-18.jpg" -Width 165 -Height 86 -Quality 75
Create-FinalImage -InputPath "images/articles/hanoi-cdc.jpg" -OutputPath "images/final-optimized/articles/hanoi-cdc.jpg" -Width 165 -Height 86 -Quality 75
Create-FinalImage -InputPath "images/articles/fpt-ceo.jpg" -OutputPath "images/final-optimized/articles/fpt-ceo.jpg" -Width 165 -Height 86 -Quality 75
Create-FinalImage -InputPath "images/articles/son-tra.jpg" -OutputPath "images/final-optimized/articles/son-tra.jpg" -Width 165 -Height 86 -Quality 75
Create-FinalImage -InputPath "images/articles/energy-market.jpg" -OutputPath "images/final-optimized/articles/energy-market.jpg" -Width 165 -Height 86 -Quality 75

# Optimize icons (20x20)
Create-FinalImage -InputPath "images/icons/search.png" -OutputPath "images/final-optimized/icons/search.jpg" -Width 20 -Height 20 -Quality 85
Create-FinalImage -InputPath "images/icons/return.png" -OutputPath "images/final-optimized/icons/return.jpg" -Width 20 -Height 20 -Quality 85

# Copy logo.svg as is (vector)
Copy-Item "images/icons/logo.svg" "images/final-optimized/icons/logo.svg"

Write-Host "`nFinal optimization completed!" -ForegroundColor Green
Write-Host "Check images/final-optimized folder for properly sized images" -ForegroundColor Cyan

# Show size comparison
Write-Host "`nFinal optimized files:" -ForegroundColor Yellow
Get-ChildItem -Path "images/final-optimized" -Recurse -File | ForEach-Object {
    $size = [math]::Round($_.Length / 1KB, 1)
    Write-Host "  $($_.Name): $size KB" -ForegroundColor White
}
