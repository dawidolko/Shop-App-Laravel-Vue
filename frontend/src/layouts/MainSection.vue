<template>
  <main class="flex-1 ml-0 sm:ml-64 pt-4">
    <div class="w3-content" style="max-width: 1200px">
      <div class="w3-display-container w3-container">
        <img
          src="https://www.w3schools.com/w3images/jeans.jpg"
          alt="Jeans"
          style="width: 100%" />
        <div
          class="w3-display-topleft w3-text-white"
          style="padding: 24px 48px">
          <h1 class="w3-jumbo w3-hide-small">New arrivals</h1>
          <h1 class="w3-hide-large w3-hide-medium">New arrivals</h1>
          <h1 class="w3-hide-small">COLLECTION 2016</h1>
          <p>
            <a href="/cart" class="w3-button w3-black w3-padding-large w3-large"
              >SHOP NOW</a
            >
          </p>
        </div>
      </div>
      <div class="search-container">
        <input
          type="text"
          v-model="searchQuery"
          placeholder="Szukaj produktów..."
          class="search-input"
          :class="{ expanded: searchExpanded }"
          @blur="collapseSearch" />
        <i class="fa fa-search search-icon" @click="toggleSearch"></i>
      </div>
      <div class="w3-container w3-text-grey" id="products">
        <p>{{ filteredProducts.length }} items</p>
      </div>
      <div class="w3-row w3-grayscale">
        <div
          v-for="(prod, index) in filteredProducts"
          :key="prod.id"
          class="w3-col l3 s6 product-card">
          <div
            class="w3-container product-container"
            style="min-height: 200px; max-height: 200px; position: relative">
            <img
              :src="`http://localhost:8000${prod.thumbnail}`"
              alt="Product Image"
              class="enlarge-on-hover"
              style="
                min-height: 130px;
                max-height: 130px;
                min-width: 80%;
                max-width: 80%;
              "
              @click.stop="
                openEnlargedImage(`http://localhost:8000${prod.thumbnail}`)
              " />
            <RouterLink
              :to="{ name: 'product', params: { id: prod.id } }"
              class="product-text-link">
              <p>
                <span class="product-title-hover">{{ prod.title }}</span
                ><br />
                <b>$ {{ prod.price }}</b>
              </p>
            </RouterLink>
            <button class="cart-button" @click.stop="addToCart(prod.id)">
              <i class="fa fa-shopping-cart"></i>
            </button>
          </div>
        </div>
      </div>
    </div>
    <div v-if="showModal" class="modal-overlay" @click="closeModal">
      <div class="modal-content" :class="modalType" @click.stop>
        <p>{{ modalMessage }}</p>
        <button class="modal-close" @click="closeModal">Close</button>
      </div>
    </div>
    <div
      v-if="showEnlargedImage"
      class="image-modal-overlay"
      @click="closeEnlargedImage">
      <div class="image-modal-content" @click.stop>
        <button class="close-btn" @click="closeEnlargedImage">&times;</button>
        <img
          :src="enlargedImageSrc"
          alt="Enlarged Product Image"
          class="enlarged-image" />
      </div>
    </div>
  </main>
</template>

<script setup>
import { ref, computed } from "vue";
import { useAuthStore } from "@/stores/auth";
import { RouterLink } from "vue-router";

const props = defineProps(["products"]);
const authStore = useAuthStore();

const showModal = ref(false);
const modalMessage = ref("");
const modalType = ref("");

const showEnlargedImage = ref(false);
const enlargedImageSrc = ref("");

const searchQuery = ref("");
const searchExpanded = ref(false);

function toggleSearch() {
  searchExpanded.value = true;
  setTimeout(() => {
    const input = document.querySelector(".search-input");
    if (input) input.focus();
  }, 100);
}
function collapseSearch() {
  if (!searchQuery.value) {
    searchExpanded.value = false;
  }
}

const filteredProducts = computed(() => {
  if (!searchQuery.value.trim()) return props.products;
  const query = searchQuery.value.toLowerCase();
  return props.products.filter((prod) => {
    return (
      (prod.title && prod.title.toLowerCase().includes(query)) ||
      (prod.description && prod.description.toLowerCase().includes(query)) ||
      (prod.category && prod.category.toLowerCase().includes(query)) ||
      (prod.brand && prod.brand.toLowerCase().includes(query))
    );
  });
});

async function addToCart(productId) {
  if (authStore.user) {
    try {
      const res = await fetch("/api/cart/add", {
        method: "post",
        headers: {
          "Content-Type": "application/json",
          authorization: `Bearer ${localStorage.getItem("token")}`,
        },
        body: JSON.stringify({ product_id: productId }),
      });
      const data = await res.json();
      if (res.ok) {
        modalMessage.value = "Added successfully";
        modalType.value = "success";
      } else {
        modalMessage.value = data.message || "Error adding product";
        modalType.value = "error";
      }
    } catch (error) {
      modalMessage.value = "Error adding product";
      modalType.value = "error";
    }
    showModal.value = true;
  } else {
    // Niezalogowany użytkownik może dodawać do koszyka (przechowywany lokalnie)
    let guestCart = JSON.parse(localStorage.getItem("guestCart") || "[]");
    const existingItem = guestCart.find(
      (item) => item.product_id === productId
    );
    if (existingItem) {
      existingItem.quantity += 1;
    } else {
      guestCart.push({ product_id: productId, quantity: 1 });
    }
    localStorage.setItem("guestCart", JSON.stringify(guestCart));
    modalMessage.value = "Added to cart (guest)";
    modalType.value = "success";
    showModal.value = true;
  }
}

function closeModal() {
  showModal.value = false;
  modalMessage.value = "";
  modalType.value = "";
}

function openEnlargedImage(src) {
  enlargedImageSrc.value = src;
  showEnlargedImage.value = true;
}

function closeEnlargedImage() {
  showEnlargedImage.value = false;
}
</script>

<style scoped>
.search-container {
  display: flex;
  flex-direction: row-reverse;
  align-items: center;
  border-radius: 5px;
  width: fit-content;
  transition: all 0.3s;
  margin-bottom: 5px;
  margin-top: 5px;
  margin-left: 15px;
  padding: 10px;
  background: #facc15;
}
.search-icon {
  color: black;
  cursor: pointer;
  font-size: 1.2rem;
  margin-right: 15px;
  transition: transform 0.3s, color 0.3s;
}
.search-icon:hover {
  color: orange;
  transform: scale(0.9);
}
.search-input {
  border: none;
  background-color: white;
  color: black;
  font-size: 1rem;
  outline: none;
  width: 0;
  transition: width 0.3s;
  padding: 0;
  margin-right: 10px;
}
.search-input.expanded {
  width: 200px;
}
.product-card {
  position: relative;
}
.product-container {
  position: relative;
}
.cart-button {
  position: absolute;
  top: 8px;
  right: 70px;
  background-color: black;
  border: none;
  font-size: 1.5rem;
  color: #ffffff;
  opacity: 0;
  transition: opacity 0.3s, color 0.3s;
  cursor: pointer;
  border-radius: 5px;
  padding: 5px 10px;
  z-index: 100;
}
.cart-button:hover {
  color: #ffa500;
}
.product-container:hover .cart-button {
  opacity: 1;
}
.product-title-hover {
  transition: text-decoration 0.3s;
}
.product-title-hover:hover {
  text-decoration: underline;
}
.enlarge-on-hover {
  transition: transform 0.3s;
  cursor: pointer;
}
.enlarge-on-hover:hover {
  transform: scale(1.05);
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
.image-modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.9);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 200;
}
.image-modal-content {
  position: relative;
  max-width: 90%;
  max-height: 90%;
}
.enlarged-image {
  width: 100%;
  height: auto;
  border-radius: 4px;
}
.close-btn {
  position: absolute;
  top: 10px;
  right: 10px;
  background-color: red;
  color: #fff;
  border: none;
  font-size: 1.5rem;
  padding: 5px 10px;
  border-radius: 5px;
  cursor: pointer;
  z-index: 210;
}
</style>
