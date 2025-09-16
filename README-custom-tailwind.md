# Custom Tailwind CSS cho Vietnamnet Clone

## 🎨 **Cách Custom Tailwind CSS**

### **Cách 1: Sử dụng Tailwind Config (Khuyến nghị)**

#### **Bước 1: Cài đặt Tailwind CSS**
```bash
# Cài đặt Tailwind CSS
npm install -D tailwindcss

# Khởi tạo config file
npx tailwindcss init
```

#### **Bước 2: Cấu hình tailwind.config.js**
File `tailwind.config.js` đã được tạo với các custom:
- **Colors**: vietnamnet-red, vietnamnet-dark-red, vietnamnet-blue
- **Fonts**: Inter, Noto Sans
- **Spacing**: Custom spacing values
- **Breakpoints**: xs, sm, md, lg, xl, 2xl, 3xl
- **Animations**: fade-in, slide-in, bounce-slow
- **Utilities**: Custom classes cho Vietnamnet

#### **Bước 3: Tạo input CSS file**
File `css/input.css` chứa:
- `@tailwind` directives
- Custom base styles
- Custom components
- Custom utilities

#### **Bước 4: Build CSS**
```bash
# Development mode (watch changes)
npm run dev

# Production build
npm run build
```

#### **Bước 5: Sử dụng trong HTML**
```html
<!-- Thay thế CDN bằng file CSS đã build -->
<link href="css/output.css" rel="stylesheet">
```

### **Cách 2: Sử dụng CDN với Custom CSS**

#### **Bước 1: Giữ CDN Tailwind**
```html
<script src="https://cdn.tailwindcss.com"></script>
```

#### **Bước 2: Thêm custom CSS**
```html
<link href="css/style.css" rel="stylesheet">
```

#### **Bước 3: Override trong style.css**
```css
/* Override Tailwind classes */
.bg-vietnamnet-red {
  background-color: #dc2626;
}

.text-vietnamnet-red {
  color: #dc2626;
}

/* Custom components */
.news-card {
  @apply bg-white border border-gray-200 overflow-hidden cursor-pointer;
}

.news-card:hover {
  @apply border-vietnamnet-red;
}
```

## 🚀 **Các Custom Classes có sẵn**

### **Colors**
```html
<!-- Background colors -->
<div class="bg-vietnamnet">Vietnamnet Red</div>
<div class="bg-vietnamnet-dark-red">Dark Red</div>
<div class="bg-vietnamnet-blue">Blue</div>

<!-- Text colors -->
<p class="text-vietnamnet">Red Text</p>
<p class="text-vietnamnet-gray">Gray Text</p>

<!-- Border colors -->
<div class="border-vietnamnet">Red Border</div>
```

### **Components**
```html
<!-- News Card -->
<article class="news-card">
  <img src="..." class="news-card img">
  <div class="news-card-content">
    <div class="news-card-category">Vietnamnet global</div>
    <h3 class="news-card-title">Article Title</h3>
    <div class="news-card-meta">2 hours ago</div>
  </div>
</article>

<!-- Buttons -->
<button class="btn-primary">Primary Button</button>
<button class="btn-secondary">Secondary Button</button>
<button class="btn-outline">Outline Button</button>

<!-- Forms -->
<label class="form-label">Label</label>
<input class="form-input" type="text" placeholder="Input">
<div class="form-error">Error message</div>
```

### **Layout**
```html
<!-- Container -->
<div class="container-vietnamnet">Content</div>

<!-- Grid -->
<div class="grid-vietnamnet">
  <div>Item 1</div>
  <div>Item 2</div>
  <div>Item 3</div>
</div>

<!-- Spacing -->
<div class="section-padding">Section with padding</div>
```

### **Utilities**
```html
<!-- Text utilities -->
<p class="text-balance">Balanced text</p>
<p class="line-clamp-2">Clamped text</p>

<!-- Scroll utilities -->
<div class="scrollbar-hide">Hidden scrollbar</div>

<!-- Animations -->
<div class="animate-fade-in">Fade in animation</div>
<div class="animate-slide-in">Slide in animation</div>
```

## 📱 **Responsive Design**

### **Breakpoints**
- `xs`: 475px
- `sm`: 640px
- `md`: 768px
- `lg`: 1024px
- `xl`: 1280px
- `2xl`: 1536px
- `3xl`: 1920px

### **Usage**
```html
<!-- Responsive grid -->
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4">
  <!-- Items -->
</div>

<!-- Responsive text -->
<h1 class="text-2xl md:text-3xl lg:text-4xl">Responsive Title</h1>

<!-- Responsive spacing -->
<div class="p-4 md:p-6 lg:p-8">Responsive padding</div>
```

## 🎯 **Best Practices**

### **1. Sử dụng Custom Components**
```css
/* Thay vì */
<div class="bg-white border border-gray-200 p-4 rounded hover:border-red-600">

/* Sử dụng */
<div class="news-card">
```

### **2. Sử dụng Custom Colors**
```css
/* Thay vì */
<div class="bg-red-600">

/* Sử dụng */
<div class="bg-vietnamnet">
```

### **3. Sử dụng Custom Utilities**
```css
/* Thay vì */
<div class="overflow-hidden text-ellipsis line-clamp-2">

/* Sử dụng */
<div class="line-clamp-2">
```

## 🔧 **Development Workflow**

### **1. Development**
```bash
# Watch for changes
npm run dev

# Serve locally
npm run serve
```

### **2. Production**
```bash
# Build minified CSS
npm run build

# Deploy
# Upload files to server
```

## 📝 **Customization Examples**

### **Thay đổi màu sắc**
```javascript
// tailwind.config.js
colors: {
  'vietnamnet-red': '#dc2626', // Thay đổi màu đỏ
  'vietnamnet-blue': '#3b82f6', // Thay đổi màu xanh
}
```

### **Thêm font mới**
```javascript
// tailwind.config.js
fontFamily: {
  'vietnamnet': ['Inter', 'system-ui', 'sans-serif'],
  'custom': ['Your Font', 'sans-serif'], // Font mới
}
```

### **Thêm animation mới**
```javascript
// tailwind.config.js
animation: {
  'bounce-slow': 'bounce 2s infinite',
  'custom-spin': 'spin 3s linear infinite', // Animation mới
}
```

## 🎨 **CSS Custom Properties**

```css
:root {
  --vietnamnet-red: #dc2626;
  --vietnamnet-dark-red: #b91c1c;
  --vietnamnet-blue: #3b82f6;
  --vietnamnet-gray: #6b7280;
  --vietnamnet-light-gray: #f3f4f6;
}
```

## 🚀 **Kết luận**

Với setup này, bạn có thể:
- ✅ Custom Tailwind CSS hoàn toàn
- ✅ Sử dụng custom components
- ✅ Responsive design dễ dàng
- ✅ Dark mode support
- ✅ Performance tối ưu
- ✅ Maintainable code

Chọn cách 1 (Config) để có full control, hoặc cách 2 (CDN + Custom CSS) để đơn giản hơn!
