-- -- phpMyAdmin SQL Dump
-- -- version 5.2.1
-- -- https://www.phpmyadmin.net/
-- --
-- -- Host: localhost
-- -- Generation Time: Feb 11, 2025 at 01:16 PM
-- -- Wersja serwera: 10.4.28-MariaDB
-- -- Wersja PHP: 8.0.28

-- SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
-- START TRANSACTION;
-- SET time_zone = "+00:00";


-- /*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
-- /*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
-- /*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
-- /*!40101 SET NAMES utf8mb4 */;

-- --
-- -- Database: `shop_app`
-- --

-- -- --------------------------------------------------------

-- --
-- -- Struktura tabeli dla tabeli `cache`
-- --

-- CREATE TABLE `cache` (
--   `key` varchar(255) NOT NULL,
--   `value` mediumtext NOT NULL,
--   `expiration` int(11) NOT NULL
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -- --------------------------------------------------------

-- --
-- -- Struktura tabeli dla tabeli `cache_locks`
-- --

-- CREATE TABLE `cache_locks` (
--   `key` varchar(255) NOT NULL,
--   `owner` varchar(255) NOT NULL,
--   `expiration` int(11) NOT NULL
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -- --------------------------------------------------------

-- --
-- -- Struktura tabeli dla tabeli `contacts`
-- --

-- CREATE TABLE `contacts` (
--   `id` bigint(20) UNSIGNED NOT NULL,
--   `user_id` bigint(20) UNSIGNED NOT NULL,
--   `name` varchar(255) NOT NULL,
--   `email` varchar(255) NOT NULL,
--   `subject` varchar(255) NOT NULL,
--   `message` text NOT NULL,
--   `created_at` timestamp NULL DEFAULT NULL,
--   `updated_at` timestamp NULL DEFAULT NULL
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --
-- -- Dumping data for table `contacts`
-- --

-- INSERT INTO `contacts` (`id`, `user_id`, `name`, `email`, `subject`, `message`, `created_at`, `updated_at`) VALUES
-- (1, 13, 'dawasd', 'adsd2@onet.pl', 'asdasda', 'asdada', '2025-02-11 09:27:30', '2025-02-11 09:27:30'),
-- (2, 13, 'asdasd@', 'asfdas2@oonet.pl', 'asdasda', 'dadsasda', '2025-02-11 09:32:20', '2025-02-11 09:32:20');

-- -- --------------------------------------------------------

-- --
-- -- Struktura tabeli dla tabeli `failed_jobs`
-- --

-- CREATE TABLE `failed_jobs` (
--   `id` bigint(20) UNSIGNED NOT NULL,
--   `uuid` varchar(255) NOT NULL,
--   `connection` text NOT NULL,
--   `queue` text NOT NULL,
--   `payload` longtext NOT NULL,
--   `exception` longtext NOT NULL,
--   `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -- --------------------------------------------------------

-- --
-- -- Struktura tabeli dla tabeli `jobs`
-- --

-- CREATE TABLE `jobs` (
--   `id` bigint(20) UNSIGNED NOT NULL,
--   `queue` varchar(255) NOT NULL,
--   `payload` longtext NOT NULL,
--   `attempts` tinyint(3) UNSIGNED NOT NULL,
--   `reserved_at` int(10) UNSIGNED DEFAULT NULL,
--   `available_at` int(10) UNSIGNED NOT NULL,
--   `created_at` int(10) UNSIGNED NOT NULL
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -- --------------------------------------------------------

-- --
-- -- Struktura tabeli dla tabeli `job_batches`
-- --

-- CREATE TABLE `job_batches` (
--   `id` varchar(255) NOT NULL,
--   `name` varchar(255) NOT NULL,
--   `total_jobs` int(11) NOT NULL,
--   `pending_jobs` int(11) NOT NULL,
--   `failed_jobs` int(11) NOT NULL,
--   `failed_job_ids` longtext NOT NULL,
--   `options` mediumtext DEFAULT NULL,
--   `cancelled_at` int(11) DEFAULT NULL,
--   `created_at` int(11) NOT NULL,
--   `finished_at` int(11) DEFAULT NULL
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -- --------------------------------------------------------

-- --
-- -- Struktura tabeli dla tabeli `migrations`
-- --

-- CREATE TABLE `migrations` (
--   `id` int(10) UNSIGNED NOT NULL,
--   `migration` varchar(255) NOT NULL,
--   `batch` int(11) NOT NULL
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --
-- -- Dumping data for table `migrations`
-- --

-- INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
-- (1, '0001_01_01_000000_create_users_table', 1),
-- (2, '0001_01_01_000001_create_cache_table', 1),
-- (3, '0001_01_01_000002_create_jobs_table', 1),
-- (4, '2024_06_18_042605_create_personal_access_tokens_table', 1),
-- (5, '2025_02_04_090116_create_products_table', 1),
-- (6, '2025_02_04_091506_create_user_product_table', 1),
-- (7, '2025_02_09_154208_create_purchases_table', 1),
-- (8, '2025_02_09_160913_create_subscribes_table', 1),
-- (9, '2025_02_09_160932_create_contacts_table', 1);

-- -- --------------------------------------------------------

-- --
-- -- Struktura tabeli dla tabeli `password_reset_tokens`
-- --

-- CREATE TABLE `password_reset_tokens` (
--   `email` varchar(255) NOT NULL,
--   `token` varchar(255) NOT NULL,
--   `created_at` timestamp NULL DEFAULT NULL
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -- --------------------------------------------------------

-- --
-- -- Struktura tabeli dla tabeli `personal_access_tokens`
-- --

-- CREATE TABLE `personal_access_tokens` (
--   `id` bigint(20) UNSIGNED NOT NULL,
--   `tokenable_type` varchar(255) NOT NULL,
--   `tokenable_id` bigint(20) UNSIGNED NOT NULL,
--   `name` varchar(255) NOT NULL,
--   `token` varchar(64) NOT NULL,
--   `abilities` text DEFAULT NULL,
--   `last_used_at` timestamp NULL DEFAULT NULL,
--   `expires_at` timestamp NULL DEFAULT NULL,
--   `created_at` timestamp NULL DEFAULT NULL,
--   `updated_at` timestamp NULL DEFAULT NULL
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -- --------------------------------------------------------

-- --
-- -- Struktura tabeli dla tabeli `products`
-- --

-- CREATE TABLE `products` (
--   `id` bigint(20) UNSIGNED NOT NULL,
--   `title` varchar(255) NOT NULL,
--   `description` text NOT NULL,
--   `price` decimal(10,2) NOT NULL,
--   `discount_percentage` decimal(5,2) NOT NULL,
--   `rating` decimal(3,2) NOT NULL,
--   `stock` int(11) NOT NULL,
--   `brand` varchar(255) NOT NULL,
--   `category` varchar(255) NOT NULL,
--   `thumbnail` varchar(255) NOT NULL,
--   `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
--   `created_at` timestamp NULL DEFAULT NULL,
--   `updated_at` timestamp NULL DEFAULT NULL
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --
-- -- Dumping data for table `products`
-- --

-- INSERT INTO `products` (`id`, `title`, `description`, `price`, `discount_percentage`, `rating`, `stock`, `brand`, `category`, `thumbnail`, `images`, `created_at`, `updated_at`) VALUES
-- (1, 'iPhone 9', 'An apple mobile which is nothing like apple', 549.00, 12.96, 4.69, 0, 'Apple', 'smartphones', '/storage/product1v1.webp', '[\"\\/storage\\/product1v1.webp\",\"\\/storage\\/product1v2.webp\",\"\\/storage\\/product1v3.webp\",\"\\/storage\\/product1v4.webp\",\"\\/storage\\/product1v5.webp\"]', '2025-02-11 08:21:17', '2025-02-11 09:10:09'),
-- (2, 'iPhone X', 'SIM-Free, Model A19211 6.5-inch Super Retina HD display with OLED technology A12 Bionic chip with ...', 899.00, 17.94, 4.44, 34, 'Apple', 'smartphones', '/storage/product2v1.webp', '[\"\\/storage\\/product2v1.webp\",\"\\/storage\\/product2v2.webp\",\"\\/storage\\/product2v3.webp\",\"\\/storage\\/product2v4.webp\"]', '2025-02-11 08:21:17', '2025-02-11 08:21:17'),
-- (3, 'Samsung Universe 9', 'Samsung\'s new variant which goes beyond Galaxy to the Universe', 1249.00, 15.46, 4.09, 36, 'Samsung', 'smartphones', '/storage/product3v1.webp', '[\"\\/storage\\/product3v1.webp\"]', '2025-02-11 08:21:17', '2025-02-11 08:21:17'),
-- (4, 'OPPOF19', 'OPPO F19 is officially announced on April 2021.', 280.00, 17.91, 4.30, 123, 'OPPO', 'smartphones', '/storage/product4v2.webp', '[\"\\/storage\\/product4v2.webp\",\"\\/storage\\/product4v3.webp\",\"\\/storage\\/product4v4.webp\",\"\\/storage\\/product4v5.webp\"]', '2025-02-11 08:21:17', '2025-02-11 08:21:17'),
-- (5, 'Huawei P30', 'Huawei’s re-badged P30 Pro New Edition was officially unveiled yesterday in Germany and now the device has made its way to the UK.', 499.00, 10.58, 4.09, 30, 'Huawei', 'smartphones', '/storage/product5v1.webp', '[\"\\/storage\\/product5v1.webp\",\"\\/storage\\/product5v2.webp\",\"\\/storage\\/product5v3.webp\"]', '2025-02-11 08:21:17', '2025-02-11 08:57:39'),
-- (6, 'MacBook Pro', 'MacBook Pro 2021 with mini-LED display may launch between September, November', 1749.00, 11.02, 4.57, 83, 'Apple', 'laptops', '/storage/product6v1.webp', '[\"\\/storage\\/product6v1.webp\",\"\\/storage\\/product6v2.webp\",\"\\/storage\\/product6v3.webp\",\"\\/storage\\/product6v4.webp\"]', '2025-02-11 08:21:17', '2025-02-11 08:21:17'),
-- (7, 'Samsung Galaxy Book', 'Samsung Galaxy Book S (2020) Laptop With Intel Lakefield Chip, 8GB of RAM Launched', 1499.00, 4.15, 4.25, 50, 'Samsung', 'laptops', '/storage/product7v1.webp', '[\"\\/storage\\/product7v1.webp\",\"\\/storage\\/product7v2.webp\",\"\\/storage\\/product7v3.webp\",\"\\/storage\\/product7v4.webp\"]', '2025-02-11 08:21:17', '2025-02-11 08:21:17'),
-- (8, 'Microsoft Surface Laptop 4', 'Style and speed. Stand out on HD video calls backed by Studio Mics. Capture ideas on the vibrant touchscreen.', 1499.00, 10.23, 4.43, 66, 'Microsoft Surface', 'laptops', '/storage/product8v1.webp', '[\"\\/storage\\/product8v1.webp\",\"\\/storage\\/product8v2.webp\",\"\\/storage\\/product8v3.webp\",\"\\/storage\\/product8v4.webp\",\"\\/storage\\/product8v5.webp\"]', '2025-02-11 08:21:17', '2025-02-11 09:42:05'),
-- (9, 'Infinix INBOOK', 'Infinix Inbook X1 Ci3 10th 8GB 256GB 14 Win10 Grey – 1 Year Warranty', 1099.00, 11.83, 4.54, 96, 'Infinix', 'laptops', '/storage/product9v1.webp', '[\"\\/storage\\/product9v1.webp\",\"\\/storage\\/product9v2.webp\",\"\\/storage\\/product9v3.webp\",\"\\/storage\\/product9v4.webp\",\"\\/storage\\/product9v5.webp\"]', '2025-02-11 08:21:17', '2025-02-11 08:21:17'),
-- (10, 'HP Pavilion 15-DK1056WM', 'HP Pavilion 15-DK1056WM Gaming Laptop 10th Gen Core i5, 8GB, 256GB SSD, GTX 1650 4GB, Windows 10', 1099.00, 6.18, 4.43, 89, 'HP Pavilion', 'laptops', '/storage/product10v1.webp', '[\"\\/storage\\/product10v1.webp\",\"\\/storage\\/product10v2.webp\",\"\\/storage\\/product10v3.webp\",\"\\/storage\\/product10v4.webp\"]', '2025-02-11 08:21:17', '2025-02-11 08:21:17'),
-- (11, 'perfume Oil', 'Mega Discount, Impression of Acqua Di Gio by GiorgioArmani concentrated attar perfume Oil', 13.00, 8.40, 4.26, 65, 'Impression of Acqua Di Gio', 'fragrances', '/storage/product11v1.jpg', '[\"\\/storage\\/product11v1.jpg\"]', '2025-02-11 08:21:17', '2025-02-11 08:21:17'),
-- (12, 'Brown Perfume', 'Royal_Mirage Sport Brown Perfume for Men & Women - 120ml', 40.00, 15.66, 4.00, 51, 'Royal_Mirage', 'fragrances', '/storage/product12v1.jpg', '[\"\\/storage\\/product12v1.jpg\"]', '2025-02-11 08:21:17', '2025-02-11 09:33:01'),
-- (13, 'Fog Scent Xpressio Perfume', 'Product details of Best Fog Scent Xpressio Perfume 100ml For Men cool long lasting perfumes for Men', 13.00, 8.14, 4.59, 61, 'Fog Scent Xpressio', 'fragrances', '/storage/product13v1.jpg', '[\"\\/storage\\/product13v1.jpg\"]', '2025-02-11 08:21:17', '2025-02-11 08:21:17'),
-- (14, 'Non-Alcoholic Concentrated Perfume Oil', 'Original Al Munakh® by Mahal Al Musk | Our Impression of Climate | 6ml Non-Alcoholic Concentrated Perfume Oil', 120.00, 15.60, 4.21, 114, 'Al Munakh', 'fragrances', '/storage/product14v1.jpg', '[\"\\/storage\\/product14v1.jpg\"]', '2025-02-11 08:21:17', '2025-02-11 08:21:17'),
-- (15, 'Eau De Perfume Spray', 'Genuine  Al-Rehab spray perfume from UAE/Saudi Arabia/Yemen High Quality', 30.00, 10.99, 4.70, 101, 'Lord - Al-Rehab', 'fragrances', '/storage/product15v1.jpg', '[\"\\/storage\\/product15v1.jpg\"]', '2025-02-11 08:21:17', '2025-02-11 09:59:58'),
-- (16, 'Hyaluronic Acid Serum', 'L\'OrÃ©al Paris introduces Hyaluron Expert Replumping Serum formulated with 1.5% Hyaluronic Acid', 19.00, 13.31, 4.83, 110, 'L\'Oreal Paris', 'skincare', '/storage/product16v1.jpg', '[\"\\/storage\\/product16v1.jpg\"]', '2025-02-11 08:21:17', '2025-02-11 08:21:17'),
-- (17, 'Tree Oil 30ml', 'Tea tree oil contains a number of compounds, including terpinen-4-ol, that have been shown to kill certain bacteria,', 12.00, 4.09, 4.52, 78, 'Hemani Tea', 'skincare', '/storage/product17v1.jpg', '[\"\\/storage\\/product17v1.jpg\"]', '2025-02-11 08:21:17', '2025-02-11 08:21:17'),
-- (18, 'Oil Free Moisturizer 100ml', 'Dermive Oil Free Moisturizer with SPF 20 is specifically formulated with ceramides, hyaluronic acid & sunscreen.', 40.00, 13.10, 4.56, 88, 'Dermive', 'skincare', '/storage/product18v1.jpg', '[\"\\/storage\\/product18v1.jpg\"]', '2025-02-11 08:21:17', '2025-02-11 08:21:17'),
-- (19, 'Skin Beauty Serum.', 'Product name: rorec collagen hyaluronic acid white face serum riceNet weight: 15 m', 46.00, 10.68, 4.42, 54, 'ROREC White Rice', 'skincare', '/storage/product19v1.jpg', '[\"\\/storage\\/product19v1.jpg\"]', '2025-02-11 08:21:17', '2025-02-11 08:21:17'),
-- (20, 'Freckle Treatment Cream- 15gm', 'Fair & Clear is Pakistan\'s only pure Freckle cream which helpsfade Freckles, Darkspots and pigments. Mercury level is 0%, so there are no side effects.', 70.00, 16.99, 4.06, 140, 'Fair & Clear', 'skincare', '/storage/product20v1.jpg', '[\"\\/storage\\/product20v1.jpg\"]', '2025-02-11 08:21:17', '2025-02-11 08:21:17'),
-- (21, '- Daal Masoor 500 grams', 'Fine quality Branded Product Keep in a cool and dry place', 20.00, 4.81, 4.44, 133, 'Saaf & Khaas', 'groceries', '/storage/product21v1.avif', '[\"\\/storage\\/product21v1.avif\"]', '2025-02-11 08:21:17', '2025-02-11 08:21:17'),
-- (22, 'Elbow Macaroni - 400 gm', 'Product details of Bake Parlor Big Elbow Macaroni - 400 gm', 14.00, 15.58, 4.57, 146, 'Bake Parlor Big', 'groceries', '/storage/product22v1.avif', '[\"\\/storage\\/product22v1.avif\"]', '2025-02-11 08:21:17', '2025-02-11 08:21:17'),
-- (23, 'Orange Essence Food Flavou', 'Specifications of Orange Essence Food Flavour For Cakes and Baking Food Item', 14.00, 8.04, 4.85, 26, 'Baking Food Items', 'groceries', '/storage/product23v1.avif', '[\"\\/storage\\/product23v1.avif\"]', '2025-02-11 08:21:17', '2025-02-11 08:21:17'),
-- (24, 'cereals muesli fruit nuts', 'original fauji cereal muesli 250gm box pack original fauji cereals muesli fruit nuts flakes breakfast cereal break fast faujicereals cerels cerel foji fouji', 46.00, 16.80, 4.94, 0, 'fauji', 'groceries', '/storage/product24v1.avif', '[\"\\/storage\\/product24v1.avif\"]', '2025-02-11 08:21:17', '2025-02-11 09:33:01'),
-- (25, 'Gulab Powder 50 Gram', 'Dry Rose Flower Powder Gulab Powder 50 Gram • Treats Wounds', 70.00, 13.58, 4.87, 47, 'Dry Rose', 'groceries', '/storage/product25v1.avif', '[\"\\/storage\\/product25v1.avif\"]', '2025-02-11 08:21:17', '2025-02-11 08:21:17'),
-- (26, 'Plant Hanger For Home', 'Boho Decor Plant Hanger For Home Wall Decoration Macrame Wall Hanging Shelf', 41.00, 17.86, 4.08, 131, 'Boho Decor', 'home-decoration', '/storage/product26v1.jpg', '[\"\\/storage\\/product26v1.jpg\"]', '2025-02-11 08:21:17', '2025-02-11 08:21:17'),
-- (27, 'Flying Wooden Bird', 'Package Include 6 Birds with Adhesive Tape Shape: 3D Shaped Wooden Birds Material: Wooden MDF, Laminated 3.5mm', 51.00, 15.58, 4.41, 17, 'Flying Wooden', 'home-decoration', '/storage/product27v1.jpg', '[\"\\/storage\\/product27v1.jpg\"]', '2025-02-11 08:21:17', '2025-02-11 08:21:17'),
-- (28, '3D Embellishment Art Lamp', '3D led lamp sticker Wall sticker 3d wall art light on/off button  cell operated (included)', 20.00, 16.49, 4.82, 54, 'LED Lights', 'home-decoration', '/storage/product28v1.jpg', '[\"\\/storage\\/product28v1.jpg\"]', '2025-02-11 08:21:17', '2025-02-11 08:21:17'),
-- (29, 'Handcraft Chinese style', 'Handcraft Chinese style art luxury palace hotel villa mansion home decor ceramic vase with brass fruit plate', 60.00, 15.34, 4.44, 7, 'luxury palace', 'home-decoration', '/storage/product29v1.jpg', '[\"\\/storage\\/product29v1.jpg\"]', '2025-02-11 08:21:17', '2025-02-11 08:21:17'),
-- (30, 'Key Holder', 'Attractive DesignMetallic materialFour key hooksReliable & DurablePremium Quality', 30.00, 2.92, 4.92, 54, 'Golden', 'home-decoration', '/storage/product30v1.jpg', '[\"\\/storage\\/product30v1.jpg\"]', '2025-02-11 08:21:17', '2025-02-11 08:21:17');

-- -- --------------------------------------------------------

-- --
-- -- Struktura tabeli dla tabeli `purchases`
-- --

-- CREATE TABLE `purchases` (
--   `id` bigint(20) UNSIGNED NOT NULL,
--   `user_id` bigint(20) UNSIGNED NOT NULL,
--   `product_id` bigint(20) UNSIGNED NOT NULL,
--   `quantity` int(10) UNSIGNED NOT NULL,
--   `price` decimal(10,2) NOT NULL,
--   `created_at` timestamp NULL DEFAULT NULL,
--   `updated_at` timestamp NULL DEFAULT NULL
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --
-- -- Dumping data for table `purchases`
-- --

-- INSERT INTO `purchases` (`id`, `user_id`, `product_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
-- (1, 12, 5, 1, 499.00, '2025-02-11 08:57:29', '2025-02-11 08:57:29'),
-- (2, 12, 5, 1, 499.00, '2025-02-11 08:57:39', '2025-02-11 08:57:39'),
-- (3, 12, 1, 94, 549.00, '2025-02-11 09:10:09', '2025-02-11 09:10:09'),
-- (4, 13, 24, 113, 46.00, '2025-02-11 09:33:01', '2025-02-11 09:33:01'),
-- (5, 13, 12, 1, 40.00, '2025-02-11 09:33:01', '2025-02-11 09:33:01'),
-- (6, 13, 15, 2, 30.00, '2025-02-11 09:35:51', '2025-02-11 09:35:51'),
-- (7, 13, 8, 2, 1499.00, '2025-02-11 09:42:05', '2025-02-11 09:42:05'),
-- (8, 13, 15, 2, 30.00, '2025-02-11 09:59:58', '2025-02-11 09:59:58');

-- -- --------------------------------------------------------

-- --
-- -- Struktura tabeli dla tabeli `sessions`
-- --

-- CREATE TABLE `sessions` (
--   `id` varchar(255) NOT NULL,
--   `user_id` bigint(20) UNSIGNED DEFAULT NULL,
--   `ip_address` varchar(45) DEFAULT NULL,
--   `user_agent` text DEFAULT NULL,
--   `payload` longtext NOT NULL,
--   `last_activity` int(11) NOT NULL
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -- --------------------------------------------------------

-- --
-- -- Struktura tabeli dla tabeli `subscribes`
-- --

-- CREATE TABLE `subscribes` (
--   `id` bigint(20) UNSIGNED NOT NULL,
--   `user_id` bigint(20) UNSIGNED NOT NULL,
--   `email` varchar(255) NOT NULL,
--   `created_at` timestamp NULL DEFAULT NULL,
--   `updated_at` timestamp NULL DEFAULT NULL
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --
-- -- Dumping data for table `subscribes`
-- --

-- INSERT INTO `subscribes` (`id`, `user_id`, `email`, `created_at`, `updated_at`) VALUES
-- (1, 13, 'asda@onet.pl', '2025-02-11 09:32:09', '2025-02-11 09:32:09');

-- -- --------------------------------------------------------

-- --
-- -- Struktura tabeli dla tabeli `users`
-- --

-- CREATE TABLE `users` (
--   `id` bigint(20) UNSIGNED NOT NULL,
--   `name` varchar(255) NOT NULL,
--   `email` varchar(255) NOT NULL,
--   `email_verified_at` timestamp NULL DEFAULT NULL,
--   `password` varchar(255) NOT NULL,
--   `remember_token` varchar(100) DEFAULT NULL,
--   `created_at` timestamp NULL DEFAULT NULL,
--   `updated_at` timestamp NULL DEFAULT NULL
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --
-- -- Dumping data for table `users`
-- --

-- INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
-- (1, 'Test User', 'test@example.com', '2025-02-11 08:21:11', '$2y$12$oCt8VHn1q/.RXK/30KFsoeIUquaRp/COpcS2JBAwwtCDzFZbN1sPa', 'a989dTNed9', '2025-02-11 08:21:12', '2025-02-11 08:21:12'),
-- (2, 'Rosetta Pacocha Sr.', 'rick.ruecker@example.com', '2025-02-11 08:21:12', '$2y$12$WRgcis.Yw9jkTOOvZOzEce5QNdPVJjoLKOOmAPOKQwqcnHkVFMV5m', 'krBKm4954j', '2025-02-11 08:21:12', '2025-02-11 08:21:12'),
-- (3, 'Giles Will DVM', 'bwiza@example.org', '2025-02-11 08:21:12', '$2y$12$MAki8kQF2CtypFBhkgLcteC4Dzq0j8CAFeHtD3sfguMFD9gQOyvwi', 'b7jKUvrLGS', '2025-02-11 08:21:13', '2025-02-11 08:21:13'),
-- (4, 'Vicente Wilderman', 'viola51@example.com', '2025-02-11 08:21:13', '$2y$12$3FQLePibhiCBNbIAmMtGWus4MSwrt2CWPkjiZO2nCwDf4dhsN7.Ae', 'IYUR758gEg', '2025-02-11 08:21:13', '2025-02-11 08:21:13'),
-- (5, 'Beulah Willms III', 'mohr.justen@example.net', '2025-02-11 08:21:13', '$2y$12$b9MxGKJznu3RBnJTiY31V.8vZQPRPf9e953WG.Bfqdq0fayRThY1e', 'MMf8kreuFr', '2025-02-11 08:21:14', '2025-02-11 08:21:14'),
-- (6, 'Megane Windler', 'lfranecki@example.com', '2025-02-11 08:21:14', '$2y$12$8u9dlVjPT1oZWjKnIe09kOjAyvC7E.HBSgbsRP/iUiIrD1NTNCM3i', 'a0Kio1c8xO', '2025-02-11 08:21:14', '2025-02-11 08:21:14'),
-- (7, 'Cristal Rogahn', 'emmanuelle30@example.org', '2025-02-11 08:21:14', '$2y$12$elxRbKOyCZjyyXwXVkE.xedUhGgO2EfH.J7d5uZOVsxG7PNKUsPYu', 'a8PaGSwseG', '2025-02-11 08:21:15', '2025-02-11 08:21:15'),
-- (8, 'Elmira Adams MD', 'green33@example.org', '2025-02-11 08:21:15', '$2y$12$.QZrAkX16zt6es5kzYjW9u1YvHB2MQKDrMkAA1ENHir1KYv6XKAzS', 'AwweYMog0m', '2025-02-11 08:21:15', '2025-02-11 08:21:15'),
-- (9, 'Prof. Jakayla Rutherford', 'herbert07@example.net', '2025-02-11 08:21:15', '$2y$12$9V/LFpsBaamvWq262Sqy1Ohovd3FtokAIbB76cLPs4BhB/GaWnguu', 'haipKPS0Er', '2025-02-11 08:21:16', '2025-02-11 08:21:16'),
-- (10, 'Mervin Morar', 'durgan.art@example.net', '2025-02-11 08:21:16', '$2y$12$ERRjowdmCWx6h0Q7j873Z.9qpYlfn7GPk872kibDgxexaBQJaQ/Je', 'H6MzEAyjSp', '2025-02-11 08:21:16', '2025-02-11 08:21:16'),
-- (11, 'Freddy Bartoletti', 'tmuller@example.net', '2025-02-11 08:21:16', '$2y$12$WcGamssQAtZ8qn4tL1mhWeRYB65L34k2IGT7u1kDAXRDmffuFm4xi', 'zPWQ2RvaGq', '2025-02-11 08:21:17', '2025-02-11 08:21:17'),
-- (12, 'dawid', 'dawid@onet.pl', NULL, '$2y$12$FlyiryGyV2qy1LE.FTBSLeVh.uu.IjCqQ5GUnGtb4FgMctgBU0Uf2', NULL, '2025-02-11 08:39:23', '2025-02-11 08:39:23'),
-- (13, 'dawid222', 'dawid1@onet.pl', NULL, '$2y$12$EWUEQdQSUA5e/0MP4EfND.9tVjWfIZUGQiC6bjWmNLLs3acVE7kHq', NULL, '2025-02-11 09:26:31', '2025-02-11 10:48:34');

-- -- --------------------------------------------------------

-- --
-- -- Struktura tabeli dla tabeli `user_product`
-- --

-- CREATE TABLE `user_product` (
--   `id` bigint(20) UNSIGNED NOT NULL,
--   `user_id` bigint(20) UNSIGNED NOT NULL,
--   `product_id` bigint(20) UNSIGNED NOT NULL,
--   `quantity` int(10) UNSIGNED NOT NULL DEFAULT 1,
--   `created_at` timestamp NULL DEFAULT NULL,
--   `updated_at` timestamp NULL DEFAULT NULL
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --
-- -- Indeksy dla zrzutów tabel
-- --

-- --
-- -- Indeksy dla tabeli `cache`
-- --
-- ALTER TABLE `cache`
--   ADD PRIMARY KEY (`key`);

-- --
-- -- Indeksy dla tabeli `cache_locks`
-- --
-- ALTER TABLE `cache_locks`
--   ADD PRIMARY KEY (`key`);

-- --
-- -- Indeksy dla tabeli `contacts`
-- --
-- ALTER TABLE `contacts`
--   ADD PRIMARY KEY (`id`),
--   ADD KEY `contacts_user_id_foreign` (`user_id`);

-- --
-- -- Indeksy dla tabeli `failed_jobs`
-- --
-- ALTER TABLE `failed_jobs`
--   ADD PRIMARY KEY (`id`),
--   ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

-- --
-- -- Indeksy dla tabeli `jobs`
-- --
-- ALTER TABLE `jobs`
--   ADD PRIMARY KEY (`id`),
--   ADD KEY `jobs_queue_index` (`queue`);

-- --
-- -- Indeksy dla tabeli `job_batches`
-- --
-- ALTER TABLE `job_batches`
--   ADD PRIMARY KEY (`id`);

-- --
-- -- Indeksy dla tabeli `migrations`
-- --
-- ALTER TABLE `migrations`
--   ADD PRIMARY KEY (`id`);

-- --
-- -- Indeksy dla tabeli `password_reset_tokens`
-- --
-- ALTER TABLE `password_reset_tokens`
--   ADD PRIMARY KEY (`email`);

-- --
-- -- Indeksy dla tabeli `personal_access_tokens`
-- --
-- ALTER TABLE `personal_access_tokens`
--   ADD PRIMARY KEY (`id`),
--   ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
--   ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

-- --
-- -- Indeksy dla tabeli `products`
-- --
-- ALTER TABLE `products`
--   ADD PRIMARY KEY (`id`);

-- --
-- -- Indeksy dla tabeli `purchases`
-- --
-- ALTER TABLE `purchases`
--   ADD PRIMARY KEY (`id`),
--   ADD KEY `purchases_user_id_foreign` (`user_id`),
--   ADD KEY `purchases_product_id_foreign` (`product_id`);

-- --
-- -- Indeksy dla tabeli `sessions`
-- --
-- ALTER TABLE `sessions`
--   ADD PRIMARY KEY (`id`),
--   ADD KEY `sessions_user_id_index` (`user_id`),
--   ADD KEY `sessions_last_activity_index` (`last_activity`);

-- --
-- -- Indeksy dla tabeli `subscribes`
-- --
-- ALTER TABLE `subscribes`
--   ADD PRIMARY KEY (`id`),
--   ADD KEY `subscribes_user_id_foreign` (`user_id`);

-- --
-- -- Indeksy dla tabeli `users`
-- --
-- ALTER TABLE `users`
--   ADD PRIMARY KEY (`id`),
--   ADD UNIQUE KEY `users_email_unique` (`email`);

-- --
-- -- Indeksy dla tabeli `user_product`
-- --
-- ALTER TABLE `user_product`
--   ADD PRIMARY KEY (`id`),
--   ADD KEY `user_product_user_id_foreign` (`user_id`),
--   ADD KEY `user_product_product_id_foreign` (`product_id`);

-- --
-- -- AUTO_INCREMENT for dumped tables
-- --

-- --
-- -- AUTO_INCREMENT for table `contacts`
-- --
-- ALTER TABLE `contacts`
--   MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

-- --
-- -- AUTO_INCREMENT for table `failed_jobs`
-- --
-- ALTER TABLE `failed_jobs`
--   MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

-- --
-- -- AUTO_INCREMENT for table `jobs`
-- --
-- ALTER TABLE `jobs`
--   MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

-- --
-- -- AUTO_INCREMENT for table `migrations`
-- --
-- ALTER TABLE `migrations`
--   MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

-- --
-- -- AUTO_INCREMENT for table `personal_access_tokens`
-- --
-- ALTER TABLE `personal_access_tokens`
--   MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

-- --
-- -- AUTO_INCREMENT for table `products`
-- --
-- ALTER TABLE `products`
--   MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

-- --
-- -- AUTO_INCREMENT for table `purchases`
-- --
-- ALTER TABLE `purchases`
--   MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

-- --
-- -- AUTO_INCREMENT for table `subscribes`
-- --
-- ALTER TABLE `subscribes`
--   MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

-- --
-- -- AUTO_INCREMENT for table `users`
-- --
-- ALTER TABLE `users`
--   MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

-- --
-- -- AUTO_INCREMENT for table `user_product`
-- --
-- ALTER TABLE `user_product`
--   MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

-- --
-- -- Constraints for dumped tables
-- --

-- --
-- -- Constraints for table `contacts`
-- --
-- ALTER TABLE `contacts`
--   ADD CONSTRAINT `contacts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

-- --
-- -- Constraints for table `purchases`
-- --
-- ALTER TABLE `purchases`
--   ADD CONSTRAINT `purchases_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
--   ADD CONSTRAINT `purchases_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

-- --
-- -- Constraints for table `subscribes`
-- --
-- ALTER TABLE `subscribes`
--   ADD CONSTRAINT `subscribes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

-- --
-- -- Constraints for table `user_product`
-- --
-- ALTER TABLE `user_product`
--   ADD CONSTRAINT `user_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
--   ADD CONSTRAINT `user_product_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
-- COMMIT;

-- /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
-- /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
-- /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
