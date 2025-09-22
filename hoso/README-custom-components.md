# Custom Tailwind Components với @apply

File `tailwind-custom.css` chứa các thành phần dùng chung được tạo từ file `index-v2.html` sử dụng `@apply` directive của Tailwind CSS.

## 📋 Danh sách các thành phần dùng chung phổ biến

### 1. **Header Components**

- **Desktop Header**: `.header-desktop`, `.header-logo`, `.header-nav`, `.header-nav-link`
- **Tablet Header**: `.header-tablet`, `.header-tablet-logo`, `.header-tablet-nav`
- **Mobile Header**: `.header-mobile`, `.header-mobile-logo`, `.header-mobile-nav`

### 2. **Profile Components**

- **Profile Group**: `.profile-group`, `.profile-group-header`, `.profile-group-title`
- **Profile Item**: `.profile-item`, `.profile-item-image`, `.profile-item-content`
- **Profile Grid**: `.profile-group-grid`

### 3. **Button Components**

- **Menu Toggle**: `.menu-toggle`
- **Search Button**: `.search-button`, `.search-button-text`
- **Back to Top**: `.back-to-top`, `.back-to-top-button`

### 4. **Form Components**

- **Search Form**: `.search-form`, `.search-form-select`, `.search-form-input`
- **Form Container**: `.search-form-input-container`

### 5. **Layout Components**

- **Main Container**: `.main-container`, `.main-content`
- **Profile Filter**: `.profile-filter-section`, `.profile-filter-container`
- **Profile Groups**: `.profile-groups-container`

### 6. **Icon Components**

- **Icons**: `.icon-hamburger`, `.icon-seemore`, `.icon-search`
- **Icon Base**: `.icon-base`

### 7. **Utility Components**

- **Navigation Scroll**: `.nav-scroll`, `.mobile-nav-scroll`, `.tablet-nav-scroll`
- **Responsive**: `.mobile-logo`, `.tablet-logo`
- **Active States**: `.mobile-nav-active`, `.tablet-nav-active`
- **Animations**: `.transition-base`, `.hover-lift`, `.hover-scale`
- **Focus States**: `.focus-ring`, `.focus-border`

## 🚀 Cách sử dụng

### 1. Import CSS file

```html
<link rel="stylesheet" href="../css/tailwind-custom.css" />
```

### 2. Sử dụng các class trong HTML

```html
<!-- Header -->
<header class="bg-white sticky top-0 z-50 shadow-sm">
  <div class="main-container">
    <div class="header-desktop">
      <div class="header-logo">
        <a href="/" class="header-logo-link">
          <img class="header-logo-img" src="logo.svg" alt="Logo" />
        </a>
      </div>
      <nav class="header-nav">
        <a href="/ho-so" class="header-nav-link">HỒ SƠ</a>
        <div class="header-nav-divider"></div>
        <a href="/ho-so/chinh-tri" class="header-nav-link-active"
          >Chính trị gia</a
        >
      </nav>
    </div>
  </div>
</header>

<!-- Profile Group -->
<div class="profile-group">
  <div class="profile-group-header">
    <h2 class="profile-group-title">
      <a href="/ho-so/chinh-tri" class="profile-group-title-link"
        >Chính trị gia</a
      >
    </h2>
    <a href="/ho-so/chinh-tri" class="profile-group-see-more">
      <span class="profile-group-see-more-text">Xem thêm</span>
      <span class="icon-seemore"></span>
    </a>
  </div>
  <div class="profile-group-grid">
    <!-- Profile items -->
  </div>
</div>

<!-- Profile Item -->
<div class="profile-item">
  <div class="profile-item-image-container">
    <a href="/profile" class="profile-item-image-link">
      <img src="profile.jpg" alt="Profile" class="profile-item-image" />
    </a>
  </div>
  <div class="profile-item-content">
    <h3 class="profile-item-title">
      <a href="/profile" class="profile-item-title-link">Tên người</a>
    </h3>
    <p class="profile-item-description">Chức vụ</p>
    <div class="profile-item-action">
      <a href="/profile" class="profile-item-action-link">
        <span class="icon-seemore"></span>
      </a>
    </div>
  </div>
</div>
```

## 🎨 Lợi ích

1. **Tái sử dụng**: Các thành phần có thể được sử dụng lại trong nhiều trang
2. **Nhất quán**: Đảm bảo thiết kế đồng nhất trên toàn bộ website
3. **Dễ bảo trì**: Thay đổi một lần, áp dụng cho tất cả
4. **Tối ưu**: Sử dụng `@apply` giúp code gọn gàng và dễ đọc
5. **Responsive**: Tự động responsive trên các thiết bị khác nhau

## 📱 Responsive Design

Các thành phần được thiết kế responsive với:

- **Mobile**: `.header-mobile`, `.mobile-nav-scroll`
- **Tablet**: `.header-tablet`, `.tablet-nav-scroll`
- **Desktop**: `.header-desktop`

## 🔧 Customization

Để tùy chỉnh màu sắc, thay đổi trong `tailwind.config.js`:

```javascript
theme: {
    extend: {
        colors: {
            'vnn-blue': '#2d67ad',
            'vnn-gray': '#8f8f8f',
            'vnn-light-blue': '#e9f0f7',
        }
    }
}
```

## 📁 File Structure

```
hoso/
├── css/
│   └── tailwind-custom.css    # Custom components
├── html/
│   ├── index-v2.html         # Original file
│   └── example-usage.html    # Usage example
└── README-custom-components.md # Documentation
```
