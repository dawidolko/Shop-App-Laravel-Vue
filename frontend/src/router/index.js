// src/router/index.js
import { createRouter, createWebHistory } from "vue-router";
import HomeView from "@/views/HomeView.vue";
import RegisterView from "@/views/Auth/RegisterView.vue";
import LoginView from "@/views/Auth/LoginView.vue";
import AboutView from "@/views/AboutView.vue";
import ContactView from "@/views/ContactView.vue";
import SupportView from "@/views/SupportView.vue";
import HelpView from "@/views/HelpView.vue";
import CartView from "@/views/CartView.vue";
import ProductDetailView from "@/views/ProductDetailView.vue";
import CategoryView from "@/views/CategoryView.vue";
import BrandView from "@/views/BrandView.vue";
import ErrorView from "@/views/ErrorView.vue";
import SettingsView from "@/views/Auth/SettingsView.vue";
import PanelView from "@/views/Auth/PanelView.vue";

import { useAuthStore } from "@/stores/auth";

const routes = [
  { path: "/", name: "home", component: HomeView },
  {
    path: "/register",
    name: "register",
    component: RegisterView,
    meta: { guest: true },
  },
  {
    path: "/login",
    name: "login",
    component: LoginView,
    meta: { guest: true },
  },
  {
    path: "/product/:id",
    name: "product",
    component: ProductDetailView,
  },
  { path: "/about", name: "about", component: AboutView },
  { path: "/contact", name: "contact", component: ContactView },
  { path: "/support", name: "support", component: SupportView },
  { path: "/help", name: "help", component: HelpView },
  { path: "/cart", name: "cart", component: CartView },
  { path: "/category/:cat", name: "categoryProducts", component: CategoryView },
  { path: "/brand/:brandName", name: "brandProducts", component: BrandView },
  {
    path: "/settings",
    name: "settings",
    component: SettingsView,
    meta: { requiresAuth: true },
  },
  {
    path: "/mypanel",
    name: "mypanel",
    component: PanelView,
    meta: { requiresAuth: true },
  },
  {
    path: "/checkout",
    name: "checkout",
    component: () => import("@/views/components/Checkout.vue"),
    meta: { requiresAuth: true },
  },
  {
    path: "/:pathMatch(.*)*",
    name: "NotFound",
    component: ErrorView,
  },
];

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes,
});

router.beforeEach(async (to) => {
  const authStore = useAuthStore();
  await authStore.getUser();
  if (to.meta.guest && authStore.user) {
    return { name: "home" };
  }
  if (to.meta.requiresAuth && !authStore.user) {
    authStore.modalMessage = "You must be logged in";
    authStore.modalType = "error";
    authStore.showModal = true;
    return { name: "home" };
  }
});

export default router;
