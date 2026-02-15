# Shop-App-Laravel-Vue 

> 🚀 **Modern E-Commerce Shop Application** - Build feature-rich online stores with Laravel backend, Vue.js frontend, and W3.CSS styling

## 📋 Description

Welcome to the **Shop App** repository! This full-stack e-commerce application retrieves product data from an external mock API and displays them in a modern, user-friendly interface. Built with a powerful Laravel backend and dynamic Vue.js frontend, this project demonstrates professional web development practices for building scalable online stores.

The application features product listing, detailed product pages, shopping cart functionality, and seamless navigation using Vue Router. Styled with the W3.CSS Clothing Store template, this project showcases best practices in API integration, state management, and responsive design implementation.

## 📁 Repository Structure

```

Shop-App-Laravel-Vue/
├── 📁 backend/ # Laravel backend application
│ ├── 📁 app/
│ │ ├── 🎮 Http/
│ │ │ └── Controllers/ # API controllers
│ │ ├── 📦 Models/ # Eloquent models
│ │ └── 🔧 Services/ # Business logic services
│ ├── 📁 config/ # Configuration files
│ ├── 📁 database/
│ │ ├── 🌱 seeders/ # Database seeders
│ │ └── 🔄 migrations/ # Database migrations
│ ├── 📁 routes/
│ │ ├── 🌐 web.php # Web routes
│ │ ├── 🔌 api.php # API endpoints
│ │ └── ⚙️ console.php # Console commands
│ ├── 📁 public/ # Public assets
│ ├── 📁 resources/ # Views and assets
│ ├── 📁 storage/ # Application storage
│ ├── 📁 tests/ # Unit and feature tests
│ ├── ⚙️ .env.example # Environment template
│ ├── 🎯 artisan # Laravel CLI
│ ├── 📦 composer.json # PHP dependencies
│ ├── 🔧 vite.config.js # Vite configuration
│ ├── 🔧 start.sh # Linux/macOS startup script
│ ├── 🔧 start.bat # Windows startup script
│ └── 📖 README.md # Backend documentation
├── 📁 frontend/ # Vue.js frontend application
│ ├── 📁 src/
│ │ ├── ⚛️ components/ # Vue components
│ │ ├── 📄 views/ # Page views
│ │ ├── 🗂️ store/ # Vuex/Pinia state management
│ │ ├── 🔀 router/ # Vue Router configuration
│ │ ├── 🎨 assets/ # Images and styles
│ │ ├── 💻 App.vue # Main Vue component
│ │ └── 🚀 main.js # Vue entry point
│ ├── 📄 index.html # Main HTML file
│ ├── 📦 package.json # Node.js dependencies
│ ├── 🔧 vite.config.js # Vite configuration
│ ├── 🎨 tailwind.config.js # Tailwind CSS config
│ ├── 🔧 start.sh # Linux/macOS startup script
│ ├── 🔧 start.bat # Windows startup script
│ ├── 📦 archive.sh # Project archiving script
│ ├── 📦 archive.bat # Project archiving script (Windows)
│ ├── 📝 CHANGELOG # Version history
│ └── 📖 README.md # Frontend documentation
├── 📁 docs/ # Project documentation
├── 📁 database/ # Database diagrams and files
└── 📖 README.md # Main project documentation

```

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/dawidolko/Shop-App-Laravel-Vue.git
cd Shop-App-Laravel-Vue
```

### 2. Backend Setup (Laravel)

#### Navigate to Backend Directory:

```bash
cd backend
```

#### Linux/macOS:

```bash
bash start.sh
```

#### Windows:

```bash
start.bat
```

#### Manual Setup:

```bash
# Install PHP dependencies
composer install

# Create environment file
cp .env.example .env

# Generate application key
php artisan key:generate

# Configure database in .env file

# Run database migrations
php artisan migrate

# (Optional) Seed database
php artisan db:seed
```

### 3. Frontend Setup (Vue.js)

#### Navigate to Frontend Directory:

```bash
cd ../frontend
```

#### Linux/macOS:

```bash
bash start.sh
```

#### Windows:

```bash
start.bat
```

#### Manual Setup:

```bash
# Install Node.js dependencies
npm install
```

### 4. Start the Application

#### Start Laravel Backend:

```bash
cd backend
php artisan serve
```

- Backend API runs at [http://localhost:8000](http://localhost:8000)

#### Start Vue Frontend:

```bash
cd frontend
npm run dev
```

- Frontend application runs at [http://localhost:5173](http://localhost:5173) (or the port shown in terminal)

## ⚙️ System Requirements

### **Essential Tools:**

- **PHP** (version 8.0 or higher)
- **Composer** for PHP dependency management
- **Node.js** (version 14.0 or higher)
- **npm** or **yarn** for JavaScript packages
- **MySQL** or compatible database system
- **Git** for version control

### **Development Environment:**

- **Laravel** (latest version)
- **Vue.js 3** with Composition API
- **Vite** for fast development and building
- **Code Editor** (VS Code, PhpStorm, WebStorm)
- **API Testing Tool** (Postman, Insomnia)

### **External Services:**

- **Mock API** - Product data from [run.mocky.io](https://run.mocky.io/v3/3266bd9d-30b5-4ace-bc63-71e411028060)
- Internet connection for external API requests

### **Recommended Extensions:**

- **Volar** for Vue 3 support in VS Code
- **Laravel** and **PHP** IntelliSense
- **Vue DevTools** browser extension
- **ESLint** for JavaScript code quality
- **Prettier** for code formatting
- **Tailwind CSS IntelliSense**

### **Frontend Stack:**

- **Vue.js 3** - Progressive JavaScript framework
- **Vue Router** - Client-side routing
- **Vuex** or **Pinia** - State management
- **W3.CSS** - Responsive CSS framework
- **Tailwind CSS** - Utility-first CSS framework
- **Vite** - Next generation frontend tooling

## ✨ Key Features

### **🛍️ Product Catalog**

- Dynamic product listing from external mock API
- Grid-based responsive product display
- Product images, prices, and descriptions
- W3.CSS Clothing Store template integration

### **📄 Product Details**

- Dedicated product detail pages
- Comprehensive product information display
- High-quality product images
- Add to cart functionality from detail page

### **🛒 Shopping Cart**

- Add products to cart from list or detail pages
- Real-time cart state management
- Cart item quantity management
- Persistent cart state across navigation

### **🔀 Seamless Navigation**

- Vue Router for single-page application experience
- Smooth transitions between views
- Breadcrumb navigation
- Back/forward browser support

### **📊 State Management**

- Global state management with Vuex or Pinia
- Persistent cart state across pages
- Centralized application data flow
- Reactive state updates

### **📱 Responsive Design**

- Mobile-first W3.CSS template
- Fully responsive layouts for all devices
- Modern CSS Grid and Flexbox
- Touch-friendly interface elements

### **⚡ Modern Build Tools**

- Vite for lightning-fast HMR (Hot Module Replacement)
- Optimized production builds
- Efficient code splitting
- Asset optimization

## 🛠️ Technologies Used

- **Laravel** - Robust PHP framework for backend
- **Vue.js 3** - Progressive JavaScript framework
- **Vue Router** - Official routing library for Vue
- **Vuex/Pinia** - State management pattern + library
- **MySQL** - Relational database management
- **W3.CSS** - Modern CSS framework
- **Tailwind CSS** - Utility-first CSS framework
- **Vite** - Next generation frontend build tool
- **Axios** - Promise-based HTTP client
- **Composer** - PHP dependency management
- **NPM** - Node.js package management

## 🌍 API Configuration

### **Mock API Endpoint**

The application retrieves product data from:

```
https://run.mocky.io/v3/3266bd9d-30b5-4ace-bc63-71e411028060
```

You can modify this URL in your Vue application's configuration or environment files (`frontend/src/config` or `.env` files).

### **Database Configuration**

Update `.env` in the Laravel `backend` folder to match your local MySQL configuration:

```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=your_database_name
DB_USERNAME=your_username
DB_PASSWORD=your_password
```

### **State Management Setup**

Configure Vuex or Pinia in the `frontend/src/store` folder for managing shared states like shopping cart or user session data.

## 📖 Usage Guide

### **1. Browse Products**

Visit the Vue application homepage to see all products retrieved from the mock API, displayed in a clean W3.CSS-styled layout.

### **2. View Product Details**

Click on any product to navigate to its detail page with comprehensive information and the ability to add to cart.

### **3. Manage Shopping Cart**

- Add items from product list or detail pages
- Cart state persists across page navigation
- View cart contents and manage quantities

### **4. Backend Integration**

Laravel provides core logic and can store additional data (user management, orders, reviews) in MySQL for enhanced functionality.

## 📊 Project Status

✅ **Completed** - Fully functional e-commerce application with cart management!

## 🤝 Contributing

Contributions are highly welcomed! Here's how you can help:

- 🐛 **Report bugs** - Found an issue? Let us know!
- 💡 **Suggest improvements** - Have ideas for better features?
- 🔧 **Submit pull requests** - Share your enhancements and solutions
- 📖 **Improve documentation** - Help make the project clearer

Feel free to open issues or reach out through GitHub for any questions or suggestions.

## 👨‍💻 Author

Created by **Dawid Olko** - Part of the full-stack web development series.

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---
