<template>
  <nav class="custom-sidebar">
    <div class="sidebar-content">
      <h3>Categories</h3>
      <img src="../assets/logo.jpg" alt="Logo" class="sidebar-logo" />

      <div
        v-for="(category, index) in categories"
        :key="index"
        class="category-item"
        @mouseenter="showBrands(category)"
        @mouseleave="hideBrands(category)">
        <a href="#" class="category-link" @click.prevent="goCategory(category)">
          {{ category.toUpperCase() }}
        </a>

        <transition name="slide">
          <div v-if="expandedCategories.includes(category)" class="brands-list">
            <a
              v-for="(brand, idx) in brandsByCategory[category]"
              :key="idx"
              href="#"
              class="brand-link"
              @click.prevent="goBrand(brand)">
              {{ brand.toUpperCase() }}
            </a>
          </div>
        </transition>
      </div>

      <RouterLink class="sidebar-contact" to="/contact"> CONTACT </RouterLink>
    </div>
  </nav>
</template>

<script setup>
import { ref, defineProps } from "vue";
import { useRouter } from "vue-router";

const props = defineProps({
  categories: {
    type: Array,
    default: () => [],
  },
});

const router = useRouter();
const expandedCategories = ref([]);
const brandsByCategory = ref({});

async function fetchBrands(category) {
  try {
    const res = await fetch(
      `/api/products/brands/${encodeURIComponent(category)}`
    );
    if (res.ok) {
      const data = await res.json();
      brandsByCategory.value[category] = data;
    }
  } catch (error) {
    console.error("Error fetching brands for category:", category, error);
  }
}

function showBrands(category) {
  if (!expandedCategories.value.includes(category)) {
    expandedCategories.value.push(category);
    fetchBrands(category);
  }
}

function hideBrands(category) {
  expandedCategories.value = expandedCategories.value.filter(
    (c) => c !== category
  );
}
async function goCategory(category) {
  await router.push({
    name: "categoryProducts",
    params: { cat: category },
  });
  window.location.reload();
}
async function goBrand(brand) {
  await router.push({
    name: "brandProducts",
    params: { brandName: brand },
  });
  window.location.reload();
}
</script>

<style scoped>
.custom-sidebar {
  width: 250px;
  background-color: #fff;
  padding: 16px;
  position: fixed;
  top: 70px;
  left: 0;
  bottom: 70px;
  overflow-y: auto;
  border-right: 1px solid #e5e5e5;
  z-index: 0;
}

.sidebar-content h3 {
  margin-top: 8px;
  font-size: 1.25rem;
  font-weight: bold;
  text-align: center;
}

.sidebar-logo {
  max-width: 65%;
  display: block;
  margin: 0 auto 16px auto;
}

.sidebar-content {
  font-size: 1rem;
  color: #4a4a4a;
}

.category-item {
  margin-bottom: 12px;
  position: relative;
  text-align: center;
}

.category-link {
  display: block;
  padding: 8px 12px;
  text-decoration: none;
  color: #333;
  transition: background-color 0.3s;
}
.category-link:hover {
  background-color: #f5f5f5;
}

.brands-list {
  padding-left: 20px;
  margin-top: 4px;
}

.brand-link {
  display: block;
  padding: 4px 8px;
  text-decoration: none;
  color: #555;
  font-size: 0.9rem;
  transition: background-color 0.3s;
}
.brand-link:hover {
  background-color: #eaeaea;
}

.slide-enter-active,
.slide-leave-active {
  transition: max-height 0.3s ease-out, opacity 0.3s ease-out;
  overflow: hidden;
}
.slide-enter-from,
.slide-leave-to {
  max-height: 0;
  opacity: 0;
}
.slide-enter-to,
.slide-leave-from {
  max-height: 200px;
  opacity: 1;
}

.sidebar-contact {
  display: block;
  margin-top: 24px;
  padding: 8px 12px;
  text-decoration: none;
  color: #333;
  border-top: 1px solid #e5e5e5;
  text-align: center;
}

@media (max-width: 640px) {
  .custom-sidebar {
    display: none;
  }
}
</style>
