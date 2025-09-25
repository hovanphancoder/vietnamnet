# 🖼️ Image Optimization Guide

## 📋 Tổng quan
Script này sẽ tải tất cả ảnh từ external URLs về local và tối ưu hóa chúng để cải thiện performance.

## 🚀 Cách sử dụng

### Phương pháp 1: Chạy tự động (Khuyến nghị)
```bash
# Chạy file batch (Windows)
optimize_images.bat

# Hoặc chạy từng bước
pip install -r requirements.txt
python download_images.py
python update_html.py
```

### Phương pháp 2: Chạy thủ công
```bash
# 1. Cài đặt dependencies
pip install -r requirements.txt

# 2. Tải và tối ưu ảnh
python download_images.py

# 3. Cập nhật HTML
python update_html.py
```

## 📁 Cấu trúc thư mục sau khi chạy

```
vietnamnet_html/
├── images/
│   ├── lcp/
│   │   ├── vpsf-2025-mobile.webp
│   │   ├── vpsf-2025-tablet.webp
│   │   └── vpsf-2025-desktop.webp
│   ├── articles/
│   │   ├── classical-concert.webp
│   │   ├── dance-duo.webp
│   │   ├── son-tra.webp
│   │   ├── energy-market.webp
│   │   ├── tiktokers.webp
│   │   ├── iphone-18.webp
│   │   ├── expressway.webp
│   │   ├── hanoi-cdc.webp
│   │   └── fpt-ceo.webp
│   └── icons/
│       ├── search.png
│       ├── return.png
│       └── logo.svg
├── index.html (đã được cập nhật)
└── ...
```

## ⚡ Tối ưu hóa được áp dụng

### 1. Format tối ưu
- **WebP**: Giảm 30-50% kích thước so với JPEG/PNG
- **SVG**: Giữ nguyên cho icons (vector)
- **GIF → WebP**: Chuyển đổi GIF động thành WebP tĩnh

### 2. Responsive images
- **Mobile**: 360px width
- **Tablet**: 550px width  
- **Desktop**: 800px width

### 3. Compression
- **Quality**: 85% (cân bằng chất lượng/kích thước)
- **Optimize**: True (tối ưu metadata)

### 4. HTML updates
- ✅ Thay thế external URLs bằng local paths
- ✅ Loại bỏ `crossorigin` attributes
- ✅ Cập nhật preload links
- ✅ Giữ nguyên responsive attributes

## 📊 Kết quả mong đợi

### Trước tối ưu:
- **Total size**: ~2.8MB
- **External requests**: 15+ requests
- **LCP time**: 3-4 giây

### Sau tối ưu:
- **Total size**: ~1.2MB (giảm 60%)
- **External requests**: 0 (local only)
- **LCP time**: 1-2 giây

## 🔧 Troubleshooting

### Lỗi thường gặp:

1. **ModuleNotFoundError: No module named 'requests'**
   ```bash
   pip install -r requirements.txt
   ```

2. **Permission denied**
   - Chạy Command Prompt as Administrator
   - Hoặc chạy từ PowerShell

3. **Images không tải được**
   - Kiểm tra kết nối internet
   - Một số URLs có thể đã thay đổi

### Kiểm tra kết quả:
```bash
# Kiểm tra thư mục images
dir images /s

# Kiểm tra HTML đã được cập nhật
findstr "images/" index.html
```

## 🎯 Lợi ích

1. **Performance**: Tải nhanh hơn 60%
2. **SEO**: Cải thiện Core Web Vitals
3. **Reliability**: Không phụ thuộc external CDN
4. **Control**: Kiểm soát hoàn toàn ảnh
5. **Cost**: Tiết kiệm băng thông

## 📝 Lưu ý

- Script sẽ tạo thư mục `images/` nếu chưa có
- Ảnh gốc sẽ được giữ lại, ảnh WebP được tạo thêm
- HTML sẽ được backup tự động trước khi cập nhật
- Có thể chạy lại script nhiều lần an toàn
