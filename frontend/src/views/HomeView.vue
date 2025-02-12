<template>
  <div class="flex flex-col min-h-screen">
    <div class="flex flex-grow">
      <MainSection :products="products" />
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from "vue";
import MainSection from "@/layouts/MainSection.vue";

const products = ref([]);

onMounted(async () => {
  try {
    const res = await fetch("/api/products");
    products.value = await res.json();
  } catch (err) {
    console.error("Błąd podczas pobierania produktów:", err);
  }
});
</script>

<style scoped>
.flex {
  display: flex;
}
.flex-col {
  flex-direction: column;
}
.min-h-screen {
  min-height: 100vh;
}
.flex-grow {
  flex-grow: 1;
}
</style>
