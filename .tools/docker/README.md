# 🛒 Shop App - Laravel + Vue

E-commerce application built with RESTful architecture featuring Laravel backend and Vue.js frontend.

## 📋 Table of Contents

- [Quick Start with Docker](#-quick-start-with-docker-recommended)
- [Local Installation](#-local-installation)
- [Features](#-features)
- [Requirements](#-requirements)
- [Documentation](#-documentation)

---

## 🐳 Quick Start with Docker (Recommended)

### Launch in 3 steps:

```bash
# 1. Navigate to docker directory
cd .tools/docker

# 2. Start the application
./start.sh          # macOS/Linux
start.bat           # Windows

# 3. Open in browser
# Frontend: http://localhost:5173
# Backend API: http://localhost:8000/api
# PHPMyAdmin: http://localhost:8080
```

**Done!** 🎉 Everything is configured automatically:

- ✅ MySQL Database
- ✅ Migrations and seeders
- ✅ Dependencies installation
- ✅ Storage for images
- ✅ Application key

### Stop:

```bash
./stop.sh           # macOS/Linux
stop.bat            # Windows
```

---

## 💻 Local Installation

### Requirements:

- PHP 8.2+
- Composer
- Node.js 20+
- MySQL 8.0+
- XAMPP/LAMPP (optional)

### Backend (Laravel):

```bash
cd backend

# 1. Create 'shop_app' database in MySQL

# 2. Copy .env.example to .env
cp .env.example .env

# 3. Edit .env and set database credentials (DB_HOST, DB_USERNAME, DB_PASSWORD)

# 4. Install dependencies
composer install

# 5. Generate application key
php artisan key:generate

# 6. Create storage symlink
php artisan storage:link

# 7. Run migrations and seeders
php artisan migrate:fresh --seed

# 8. Start development server
php artisan serve
```

Backend will be available at: `http://127.0.0.1:8000`

### Frontend (Vue):

```bash
cd frontend

# 1. Install dependencies
npm install

# 2. Start development server
npm run dev
```

Frontend will be available at: `http://localhost:5173`

**Or use startup scripts:**

```bash
# Backend
cd backend
./start.sh          # macOS/Linux
start.bat           # Windows

# Frontend
cd frontend
./start.sh          # macOS/Linux
start.bat           # Windows
```

---

## ✨ Features

### 🔐 For logged-in users:

- Shopping cart management
- Order history
- User profile management
- Product reviews and ratings

### 🌍 For everyone:

- Browse products catalog
- Product search and filtering
- Product details and images
- Category browsing

---

## 🛠️ Requirements

### Docker (recommended):

- Docker Desktop or Docker Engine + Docker Compose
- 4GB free RAM
- Free ports: 3307, 5173, 8000, 8080

### Local installation:

- **PHP:** 8.2 or higher
- **Composer:** 2.x
- **Node.js:** 20.x or higher
- **npm:** 10.x or higher
- **MySQL:** 8.0 or higher
- **Laravel:** 11.x
- **Vue:** 3.x
- **Vite:** 5.x

---

## 📚 Documentation

### Backend (Laravel):

- [Backend README](../../backend/README.md) - API documentation
- Framework: Laravel 11.x
- Database: MySQL with migrations
- Authentication: Laravel Sanctum

### Frontend (Vue):

- [Frontend README](../../frontend/README.md) - Application structure
- Framework: Vue 3.x + Vite 5.x
- Routing: Vue Router
- Styling: Tailwind CSS
- State Management: Pinia

---

## 🗂️ Project Structure

```
Shop-App-Laravel-Vue/
├── .tools/
│   └── docker/              # Docker configuration
│       ├── docker-compose.yml
│       ├── Dockerfile.backend
│       ├── Dockerfile.frontend
│       ├── start.sh / start.bat
│       ├── stop.sh / stop.bat
│       └── ...
├── backend/                 # Laravel API
│   ├── app/
│   ├── config/
│   ├── database/
│   └── ...
├── frontend/                # Vue App
│   ├── src/
│   │   ├── components/
│   │   ├── views/
│   │   └── router/
│   └── ...
└── database/                # SQL dumps and migrations
```

---

## 🚀 Useful Commands

### Docker:

```bash
# Start
cd .tools/docker && ./start.sh

# Stop
./stop.sh

# View logs
docker compose logs -f

# Status
docker compose ps

# Enter container
docker compose exec backend bash
docker compose exec frontend sh

# Makefile (macOS/Linux)
make up           # Start
make down         # Stop
make logs         # Logs
make fresh        # Reset database
make help         # All commands
```

### Backend:

```bash
# Migrations
php artisan migrate
php artisan migrate:fresh --seed

# Cache
php artisan cache:clear
php artisan config:clear

# Tests
php artisan test
```

### Frontend:

```bash
# Development
npm run dev

# Build
npm run build

# Preview production build
npm run preview
```

---

## 🐛 Troubleshooting

### Docker cannot start containers:

```bash
# Check if Docker Desktop is running
docker --version

# Check if ports are free
lsof -ti:8000 | xargs kill -9
lsof -ti:5173 | xargs kill -9
```

### Backend not working:

```bash
# View logs
docker compose logs backend

# Restart backend
docker compose restart backend
```

### Frontend not connecting to API:

1. Make sure backend is running: http://localhost:8000/api
2. For Docker: API URL should be `http://localhost:8000`
3. For local: API URL should be `http://127.0.0.1:8000`

### Database has no data:

```bash
# Docker
docker compose exec backend php artisan migrate:fresh --seed

# Local
cd backend && php artisan migrate:fresh --seed
```

---

## 📄 License

MIT License - See [LICENSE](../../LICENSE)

---

**Enjoy Shop App!** 🛒🛍️💳
