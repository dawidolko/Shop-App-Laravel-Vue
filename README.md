# Shop with Product List (Laravel + Vue)

This project is a simple shop application that retrieves product data from an external mock API and displays them in a user-friendly interface. The backend is built with **Laravel**, while the frontend uses **Vue**. We utilize a [W3.CSS Clothing Store template](https://www.w3schools.com/w3css/tryw3css_templates_clothing_store.htm) to give the shop a clean, modern look.
 
---

## Project Structure

- **backend/** – Laravel application (manages API, database connections, and business logic).
- **frontend/** – Vue application (user interface, product listing, product details, and cart management).
- **docs/** – Project documentation (e.g., guides, additional notes).
- **database/** – Files and diagrams related to the database (MySQL).

```
project
├── README.md
├── docs
├── database
├── backend
│   ├── app
│   ├── bootstrap
│   ├── config
│   ├── database
│   ├── public
│   ├── resources
│   ├── routes
│   ├── storage
│   ├── tests
│   ├── vendor
│   ├── .env
│   ├── .env.example
│   ├── .gitattributes
│   ├── .gitignore
│   ├── artisan
│   ├── composer.json
│   ├── composer.lock
│   ├── phpunit.xml
│   ├── README.md
│   ├── start.bat
│   ├── start.sh
│   └── vite.config.js
├── frontend
│   ├── .vscode
│   ├── src
│   ├── .gitignore
│   ├── index.html
│   ├── jsconfig.json
│   ├── package.json
│   ├── postcss.config.js
│   ├── README.md
│   ├── start.bat
│   ├── start.sh
│   ├── tailwind.config.js
│   ├── vite.config.js
│   ├── archive.bat
│   ├── archive.sh
│   ├── CHANGELOG
│   ├── LICENSE
│   └── node_modules
```

---

## Features

- **Product List**: Fetches a list of products from the external API  
  [https://run.mocky.io/v3/3266bd9d-30b5-4ace-bc63-71e411028060]
- **Product Details**: Displays detailed information about each product on its own page.
- **Shopping Cart**: Users can add items to the cart from both the product list and individual product pages.
- **Routing**: Uses Vue Router for seamless navigation between product list, product detail pages, and other views.
- **State Management**: Vuex or Pinia can be utilized to manage global state (e.g., cart items) across the application.
- **W3.CSS Template**: Leverages a ready-made template for a responsive and stylish layout.

---

## Requirements

- **PHP >= 8.x** (with Composer)
- **Node.js >= 14.x** (with npm or yarn)
- **MySQL** or a supported database for Laravel
- Connection to the mock API \[run.mocky.io\] (ensure your environment allows external HTTP requests)

---

## Installation

1. **Clone the repository**:

   ```bash
   git clone https://gitlab.ideo.pl/d.olko/shop-app-laravel-vue
   cd shop-app-laravel-vue
   ```

2. **Backend (Laravel) setup**:

   - Go to the `backend` folder:
     ```bash
     cd backend
     ```
   - Install dependencies (LINUX/MACOS):

     ```bash
     bash start.sh
     ```

   - Install dependencies (WINDOWS):
     ```bash
     start.bat
     ```

3. **Frontend (Vue) setup**:

   - Go to the `frontend` folder:
     ```bash
     cd ../frontend
     ```
   - Install required packages (LINUX/MACOS):

     ```bash
     bash start.sh
     ```

   - Install required packages (WINDOWS):
     ```bash
     start.bat
     ```

4. **Run the application**:
   - **Laravel server** (in `backend` folder):
     ```bash
     php artisan serve
     ```
   - **Vue development server** (in `frontend` folder):
     ```bash
     npm run dev
     ```
   - Open your browser at the indicated localhost addresses to see both the backend and frontend in action.

---

## Usage

1. **Product Listing**

   - Visit the Vue application homepage to see all products retrieved from the mock API endpoint.
   - The layout is based on the W3.CSS Clothing Store template, giving an immediate polished feel.

2. **Product Details**

   - Click on a product to view more information on a separate page.
   - Vue Router handles the transition, allowing smooth in-app navigation.

3. **Shopping Cart**

   - Add items to the cart directly from the list or product detail page.
   - If you’re using Vuex or Pinia, the cart state is maintained globally, so items remain in the cart across different pages.

4. **Backend**
   - Laravel provides the core logic and can store additional data in MySQL if you decide to integrate user management, orders, or other persistent information.

---

## Configuration

- **Mock API URL**:  
  Currently set to `https://run.mocky.io/v3/3266bd9d-30b5-4ace-bc63-71e411028060`. You can change this URL in your Vue application’s configuration or environment files.
- **Database**:  
  Update `.env` in the Laravel `backend` folder to match your local MySQL configuration. Migrations are available to set up additional tables as needed.
- **Vuex/Pinia**:  
  Configure your global store (if using) in the `frontend/src/store` folder for managing shared states like the cart or user session.

---

## Author

Created as a **practice project** for demonstrating a basic **Laravel + Vue** shop setup. Feel free to adapt, extend, or share this project for educational or personal use.

---

## Project Status

**In Development** – Creating...
