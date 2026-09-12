# Shop App

> 🛒 **A basket that survives the browser** — a Laravel API and a Vue 3 storefront where the cart lives against the account, not in local storage

**Shop App** is a full-stack shop. Vue 3 renders the storefront — catalogue, categories, brands, product pages, basket and checkout — and Laravel 11 serves it over a JSON API secured with Sanctum. The basket is a table in the database, tied to the signed-in user, so it is still there on the next device and the next day.

Checkout is not a single button: it collects shipping, invoice and payment details into their own tables and turns the basket into a purchase, which the account area can then list.

![Laravel](https://img.shields.io/badge/Laravel-11-FF2D20?logo=laravel&logoColor=white)
![PHP](https://img.shields.io/badge/PHP-8.2-777BB4?logo=php&logoColor=white)
![Vue.js](https://img.shields.io/badge/Vue.js-3-4FC08D?logo=vuedotjs&logoColor=white)
![Pinia](https://img.shields.io/badge/Pinia-2-FFD859?logo=vuedotjs&logoColor=black)
![Vite](https://img.shields.io/badge/Vite-5-646CFF?logo=vite&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-8-4479A1?logo=mysql&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green)

---

## 🎯 Key Features

- **The basket is a table, not browser state** — `user_product` ties a line to an account, so closing the tab, switching machine or signing in elsewhere finds the same basket.
- **Checkout writes the paperwork** — shipping details, invoice details and payment details each land in their own table, and the basket becomes a `Purchase` the account area can list.
- **Browse by category or by brand** — the API exposes both, and the brand list is scoped to the category you are in rather than being one flat list.
- **Search over the catalogue** — a dedicated endpoint, so the front end never filters a full product list in the browser.
- **Token authentication** — Sanctum issues the token, Pinia holds the session, and every protected route sits behind `auth:sanctum`.
- **Contact and newsletter go somewhere** — both forms write to their own tables instead of sending mail into the void.
- **Routing that covers the edges** — help, support, about and a 404 view are part of the router, not afterthoughts.

---

## 🧩 API Endpoints

| Method   | Path                             | Guard   | Purpose                              |
| -------- | -------------------------------- | ------- | ------------------------------------ |
| `POST`   | `/api/register`                  | —       | Create an account.                   |
| `POST`   | `/api/login`                     | —       | Issue a Sanctum token.               |
| `POST`   | `/api/logout`                    | sanctum | Revoke the token.                    |
| `POST`   | `/api/user/update`               | sanctum | Update the account.                  |
| `GET`    | `/api/products`                  | —       | The catalogue.                       |
| `GET`    | `/api/products/categories`       | —       | Category list.                       |
| `GET`    | `/api/products/brands/{category}`| —       | Brands within a category.            |
| `GET`    | `/api/products/category/{slug}`  | —       | Products in a category.              |
| `GET`    | `/api/products/brand/{brand}`    | —       | Products of a brand.                 |
| `GET`    | `/api/products/search`           | —       | Search the catalogue.                |
| `GET`    | `/api/products/{id}`             | —       | One product.                         |
| `GET`    | `/api/cart`                      | sanctum | The basket.                          |
| `POST`   | `/api/cart/add`                  | sanctum | Add a line.                          |
| `POST`   | `/api/cart/update-quantity`      | sanctum | Change a quantity.                   |
| `DELETE` | `/api/cart/{id}`                 | sanctum | Remove a line.                       |
| `POST`   | `/api/cart/buy`                  | sanctum | Turn the basket into a purchase.     |
| `POST`   | `/api/checkout`                  | sanctum | Shipping, invoice and payment data.  |
| `GET`    | `/api/purchases`                 | sanctum | Purchase history.                    |
| `POST`   | `/api/subscribe`                 | sanctum | Newsletter sign-up.                  |
| `POST`   | `/api/contact`                   | sanctum | Contact message.                     |

---

## 🛠️ Technology Stack

### Backend

| Technology          | Version | Role                                              |
| ------------------- | ------- | ------------------------------------------------- |
| **Laravel**         | 11      | JSON API, Eloquent, migrations, validation.       |
| **PHP**             | 8.2     | Runtime.                                          |
| **Laravel Sanctum** | 4       | Token authentication for the SPA.                 |
| **MySQL**           | 8       | Products, baskets, purchases, checkout details.   |

### Frontend

| Technology       | Version | Role                                          |
| ---------------- | ------- | --------------------------------------------- |
| **Vue.js**       | 3       | Composition API, single-file components.      |
| **Vue Router**   | 4       | Views and guarded routes.                     |
| **Pinia**        | 2       | Session store.                                |
| **Vite**         | 5       | Dev server and build.                         |
| **Axios**        | 1.7     | API calls with the bearer token.              |
| **W3.CSS**       | —       | Base stylesheet.                              |

---

## 🚀 Getting Started

### Prerequisites

- PHP 8.2 or newer with Composer
- Node.js 18 or newer with npm
- MySQL 8 (or MariaDB)

### 1. Clone the repository

```bash
git clone https://github.com/dawidolko/Shop-App-Laravel-Vue.git
cd Shop-App-Laravel-Vue
```

### 2. Backend

```bash
cd backend
composer install
cp .env.example .env
php artisan key:generate
```

Set the database in `.env`, then create the schema and load the catalogue:

```bash
php artisan migrate --seed      # ProductsTableSeeder fills the shop
php artisan serve               # http://127.0.0.1:8000
```

### 3. Frontend

```bash
cd ../frontend
npm install
npm run dev                     # http://localhost:5173
```

---

## 📁 Project Structure

```
Shop-App-Laravel-Vue/
├── backend/                          # Laravel 11 API
│   ├── app/
│   │   ├── Http/Controllers/
│   │   │   ├── ProductController.php   # catalogue, categories, brands, search
│   │   │   ├── CartController.php      # basket lines and buying
│   │   │   ├── CheckoutController.php  # shipping, invoice, payment
│   │   │   ├── PurchaseController.php  # order history
│   │   │   ├── AuthController.php
│   │   │   ├── SubscribeController.php
│   │   │   └── ContactController.php
│   │   └── Models/
│   │       ├── Product.php   UserProduct.php   Purchase.php
│   │       ├── ShippingDetail.php   InvoiceDetail.php   PaymentDetail.php
│   │       └── Subscribe.php   Contact.php   User.php
│   ├── database/
│   │   ├── migrations/                 # products, baskets, purchases, checkout tables
│   │   └── seeders/ProductsTableSeeder.php
│   └── routes/api.php                  # the table above
├── frontend/                         # Vue 3 + Vite
│   └── src/
│       ├── views/                      # Home, Category, Brand, ProductDetail, Cart, Auth…
│       ├── layouts/                    # shared shell
│       ├── stores/auth.js              # Pinia session
│       └── router/                     # routes and guards
├── database/                         # SQL dump for a quick import
└── docs/                             # documentation
```

---

## 📄 License

MIT © [Dawid Olko](https://dawidolko.pl)
