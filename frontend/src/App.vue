<template>
  <div class="app-wrapper">
    <Navbar />
    <main class="app-main">
      <Sidebar :categories="categories" />
      <RouterView />
    </main>
    <Footer />
  </div>
</template>

<script setup>
import Navbar from "@/layouts/Navbar.vue";
import Sidebar from "@/layouts/Sidebar.vue";
import Footer from "@/layouts/Footer.vue";
import { RouterView } from "vue-router";
import { ref, onMounted } from "vue";

const categories = ref([]);

onMounted(async () => {
  try {
    const res = await fetch("/api/products/categories");
    categories.value = await res.json();
  } catch (err) {
    console.error("Błąd podczas pobierania kategorii:", err);
  }
});
</script>

<style scoped>
.app-wrapper {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
}
.app-main {
  display: flex;
  flex: 1;
}
</style>
