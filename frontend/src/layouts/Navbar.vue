<template>
  <header class="navbar">
    <nav class="navbar-container">
      <div class="navbar-logo desktop-only">
        <RouterLink :to="{ name: 'home' }" class="logo-link"
          >ShopApp</RouterLink
        >
      </div>
      <ul class="navbar-menu desktop-menu">
        <li class="align-middle">
          <RouterLink
            :to="{ name: 'home' }"
            class="nav-link"
            active-class="nav-link-active"
            exact-active-class="nav-link-active">
            Home
          </RouterLink>
        </li>
        <li class="align-middle">
          <RouterLink
            :to="{ name: 'about' }"
            class="nav-link"
            active-class="nav-link-active"
            exact-active-class="nav-link-active">
            About us
          </RouterLink>
        </li>
        <li class="align-middle">
          <RouterLink
            :to="{ name: 'support' }"
            class="nav-link"
            active-class="nav-link-active"
            exact-active-class="nav-link-active">
            Support
          </RouterLink>
        </li>
        <li class="align-middle">
          <RouterLink
            :to="{ name: 'help' }"
            class="nav-link"
            active-class="nav-link-active"
            exact-active-class="nav-link-active">
            Help
          </RouterLink>
        </li>
        <li class="divider">|</li>
        <li v-if="!currentUser" class="login-link align-middle">
          <RouterLink
            :to="{ name: 'login' }"
            class="nav-link"
            active-class="nav-link-active"
            exact-active-class="nav-link-active">
            Login
          </RouterLink>
        </li>
        <li v-else class="user-section align-middle user-dropdown">
          <span class="welcome-text">
            Welcome back, {{ currentUser.name }}!
          </span>
          <div class="dropdown-content">
            <RouterLink class="dropdown-link" to="/mypanel"
              >MY PANEL</RouterLink
            >
            <RouterLink class="dropdown-link" to="/settings"
              >SETTINGS</RouterLink
            >
            <RouterLink class="dropdown-link" to="/about">ABOUT</RouterLink>
            <button class="dropdown-link" @click="handleLogout">LOGOUT</button>
          </div>
        </li>
        <li class="cart-section align-middle desktop-only">
          <button class="cart-btn" @click="handleCartClick" title="Cart">
            <i class="fa fa-shopping-cart"></i>
            <span class="cart-badge" v-if="cartCount > 0">{{ cartCount }}</span>
          </button>
        </li>
      </ul>

      <div class="mobile-header mobile-only">
        <div class="mobile-logo">
          <RouterLink :to="{ name: 'home' }" class="logo-link"
            >ShopApp</RouterLink
          >
        </div>
        <div class="mobile-cart">
          <button class="cart-btn" @click="handleCartClick" title="Cart">
            <i class="fa fa-shopping-cart"></i>
            <span class="cart-badge" v-if="cartCount > 0">{{ cartCount }}</span>
          </button>
        </div>
      </div>

      <div class="mobile-menu-btn">
        <button @click="toggleMobileMenu" class="hamburger-btn">
          <span v-if="!isMobileMenuOpen">&#9776;</span>
          <span v-else>&times;</span>
        </button>
      </div>
    </nav>

    <div v-if="isMobileMenuOpen" class="mobile-menu">
      <ul class="mobile-menu-list">
        <li class="align-middle">
          <RouterLink
            @click="closeMobileMenu"
            :to="{ name: 'home' }"
            class="mobile-nav-link"
            active-class="nav-link-active"
            exact-active-class="nav-link-active">
            Home
          </RouterLink>
        </li>
        <li class="align-middle">
          <RouterLink
            @click="closeMobileMenu"
            :to="{ name: 'about' }"
            class="mobile-nav-link"
            active-class="nav-link-active"
            exact-active-class="nav-link-active">
            About us
          </RouterLink>
        </li>
        <li class="align-middle">
          <RouterLink
            @click="closeMobileMenu"
            :to="{ name: 'support' }"
            class="mobile-nav-link"
            active-class="nav-link-active"
            exact-active-class="nav-link-active">
            Support
          </RouterLink>
        </li>
        <li class="align-middle">
          <RouterLink
            @click="closeMobileMenu"
            :to="{ name: 'help' }"
            class="mobile-nav-link"
            active-class="nav-link-active"
            exact-active-class="nav-link-active">
            Help
          </RouterLink>
        </li>
        <li v-if="!currentUser" class="mobile-login-link align-middle">
          <RouterLink
            @click="closeMobileMenu"
            :to="{ name: 'login' }"
            class="mobile-nav-link"
            active-class="nav-link-active"
            exact-active-class="nav-link-active">
            Login
          </RouterLink>
        </li>
        <li v-else class="align-middle mobile-dropdown">
          <span class="mobile-welcome" @click="toggleMobileDropdown">
            Welcome back, {{ currentUser.name }}!
          </span>
          <div v-if="mobileDropdownOpen" class="mobile-dropdown-content">
            <RouterLink
              @click="closeMobileMenu"
              to="/mypanel"
              class="mobile-nav-link">
              MY PANEL
            </RouterLink>
            <RouterLink
              @click="closeMobileMenu"
              to="/settings"
              class="mobile-nav-link">
              SETTINGS
            </RouterLink>
            <RouterLink
              @click="closeMobileMenu"
              to="/about"
              class="mobile-nav-link">
              ABOUT
            </RouterLink>
            <button class="mobile-nav-link logout-btn" @click="mobileLogout">
              LOGOUT
            </button>
          </div>
        </li>
      </ul>
    </div>
  </header>
</template>

<script setup>
import { ref, computed, onMounted, onBeforeUnmount } from "vue";
import { useAuthStore } from "@/stores/auth";
import { RouterLink, useRouter } from "vue-router";

const authStore = useAuthStore();
const router = useRouter();

const currentUser = computed(() => authStore.user);
const isMobileMenuOpen = ref(false);
const mobileDropdownOpen = ref(false);
const cartCount = ref(0);

function toggleMobileMenu() {
  isMobileMenuOpen.value = !isMobileMenuOpen.value;
}

function closeMobileMenu() {
  isMobileMenuOpen.value = false;
}

function toggleMobileDropdown() {
  mobileDropdownOpen.value = !mobileDropdownOpen.value;
}

function handleCartClick() {
  router.push({ name: "cart" });
}

async function handleLogout() {
  await authStore.logout();
  showLogoutModal.value = true;
  setTimeout(() => {
    showLogoutModal.value = false;
  }, 2000);
  cartCount.value = 0;
}

function closeLogoutModal() {
  showLogoutModal.value = false;
}

function mobileLogout() {
  closeMobileMenu();
  handleLogout();
}

async function fetchCartCount() {
  if (currentUser.value) {
    try {
      const res = await fetch("/api/cart", {
        headers: {
          authorization: `Bearer ${localStorage.getItem("token")}`,
        },
      });
      if (res.ok) {
        const cartItems = await res.json();
        cartCount.value = cartItems.reduce(
          (sum, item) => sum + item.pivot.quantity,
          0
        );
      } else {
        cartCount.value = 0;
      }
    } catch (error) {
      cartCount.value = 0;
    }
  } else {
    let guestCart = JSON.parse(localStorage.getItem("guestCart") || "[]");
    cartCount.value = guestCart.reduce((sum, item) => sum + item.quantity, 0);
  }
}

onMounted(() => {
  authStore.getUser().then(() => {
    if (authStore.user) {
      localStorage.removeItem("guestCart");
    }
  });
  fetchCartCount();
  const interval = setInterval(() => {
    fetchCartCount();
  }, 5000);
  onBeforeUnmount(() => {
    clearInterval(interval);
  });
});
</script>

<style scoped>
.navbar {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  background-color: #000;
  color: #e2e8f0;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
  z-index: 10;
}
.navbar + * {
  padding-top: 80px;
}
.navbar-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0.75rem 1rem;
  display: flex;
  align-items: center;
  justify-content: space-between;
}
.logo-link {
  font-size: 2.2rem;
  color: #e2e8f0;
  text-decoration: none;
}
.desktop-menu {
  display: flex;
  align-items: center;
  list-style: none;
  margin: 0;
  padding: 0;
}
.desktop-menu li {
  margin-right: 1rem;
  display: flex;
  align-items: center;
}
.nav-link {
  color: #e2e8f0;
  text-decoration: none;
  padding: 0.5rem;
}
.nav-link-active {
  color: #facc15;
}
.divider {
  color: #e2e8f0;
  margin: 0 0.5rem;
}
.user-section .welcome-text {
  font-size: 0.9rem;
  margin-right: 0.5rem;
}
.user-dropdown {
  position: relative;
  cursor: pointer;
}
.user-dropdown .dropdown-content {
  position: absolute;
  top: 1.2rem;
  left: 0;
  background-color: #222;
  padding: 0.5rem;
  display: none;
  flex-direction: column;
  min-width: 140px;
  border: 1px solid #333;
  z-index: 50;
}
.user-dropdown:hover .dropdown-content {
  display: flex;
}
.dropdown-link {
  color: #e2e8f0;
  padding: 6px 12px;
  text-decoration: none;
  border-radius: 4px;
  text-align: left;
  margin: 2px 0;
  background-color: transparent;
  border: none;
  font: inherit;
  cursor: pointer;
}
.dropdown-link:hover {
  background-color: #444;
  color: #facc15;
}
.cart-section {
  position: relative;
}
.cart-btn {
  background: none;
  border: none;
  color: #e2e8f0;
  font-size: 1.5rem;
  cursor: pointer;
  padding: 0.5rem;
  transition: color 0.3s;
}
.align-middle {
  text-align: center;
}
.cart-btn:hover {
  color: #facc15;
}
.cart-badge {
  position: absolute;
  top: -4px;
  right: -4px;
  background-color: red;
  color: #fff;
  border-radius: 50%;
  font-size: 0.7rem;
  padding: 2px 6px;
}
.mobile-header {
  display: none;
  width: 100%;
  padding: 0.5rem 1rem;
  justify-content: space-between;
  align-items: center;
  background-color: #000;
}
.mobile-logo .logo-link {
  font-size: 2rem;
  color: #e2e8f0;
  text-decoration: none;
}
.mobile-logo a:hover,
.navbar-logo a:hover {
  color: #facc15;
}
.mobile-cart {
  position: relative;
}
.mobile-cart .cart-btn {
  font-size: 1.8rem;
}
.mobile-menu-btn {
  display: none;
}
.hamburger-btn {
  background: none;
  border: none;
  font-size: 2rem;
  color: #e2e8f0;
  cursor: pointer;
}
.mobile-menu {
  background-color: #000;
}
.mobile-menu-list {
  list-style: none;
  margin: 0;
  padding: 1rem;
  display: flex;
  flex-direction: column;
  gap: 1rem;
}
.mobile-nav-link {
  color: #e2e8f0;
  text-decoration: none;
  padding: 0.5rem;
}
.mobile-welcome {
  color: #e2e8f0;
  text-align: center;
  margin-bottom: 0.5rem;
}
.mobile-dropdown {
  position: relative;
  text-align: center;
  cursor: pointer;
}
.mobile-dropdown-content {
  display: none;
  background-color: #222;
  padding: 0.5rem;
  border: 1px solid #333;
  margin-top: 5px;
}
.mobile-dropdown:hover .mobile-dropdown-content {
  display: block;
}
.logout-btn {
  background-color: #f44336;
  border-radius: 5px;
  margin: 10px;
}
.logout-btn:hover {
  color: #facc15;
}
.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.5);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 100;
}
.modal-content {
  background: #fff;
  padding: 20px;
  border-radius: 4px;
  min-width: 300px;
  text-align: center;
}
.modal-content.error {
  background-color: #f8d7da;
  color: #721c24;
}
.modal-content.success {
  background-color: #d4edda;
  color: #155724;
}
.modal-close {
  margin-top: 10px;
  padding: 6px 12px;
  border: none;
  background: #ccc;
  cursor: pointer;
}
@media (max-width: 860px) {
  .desktop-menu {
    display: none;
  }
  .mobile-menu-btn {
    display: block;
  }
  .mobile-header {
    display: flex;
  }
  .navbar-logo.desktop-only {
    display: none;
  }
}
@media (min-width: 860px) {
  .mobile-header {
    display: none;
  }
}
</style>
