@echo off
echo 🚀 Starting image optimization process...

echo.
echo 📦 Installing Python dependencies...
pip install -r requirements.txt

echo.
echo 📥 Downloading and optimizing images...
python download_images.py

echo.
echo 🔄 Updating HTML with local images...
python update_html.py

echo.
echo ✅ Image optimization completed!
echo.
echo 📁 Check the 'images' folder for optimized images
echo 📄 HTML has been updated to use local images
echo.
pause
