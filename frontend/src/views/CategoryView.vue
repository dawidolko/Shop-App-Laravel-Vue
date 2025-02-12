<template>
  <div class="w3-content">
    <h1 class="category-title">Category: {{ category }}</h1>
    <div class="w3-container w3-text-grey" id="products">
      <p>{{ products.length }} items</p>
    </div>
    <div class="w3-row w3-grayscale">
      <div
        v-for="(prod, index) in products"
        :key="prod.id"
        class="w3-col l3 s6 product-card">
        <div class="w3-container product-container">
          <img
            :src="fullImagePath(prod.thumbnail)"
            alt="Product Image"
            class="enlarge-on-hover"
            @click.stop="openEnlargedImage(fullImagePath(prod.thumbnail))" />
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
  </div>
</template>

<script setup>
import { ref, onMounted } from "vue";
import { useRoute, RouterLink } from "vue-router";
import { useAuthStore } from "@/stores/auth";

const route = useRoute();
const authStore = useAuthStore();
const category = route.params.cat;
const products = ref([]);

const showModal = ref(false);
const modalMessage = ref("");
const modalType = ref("");
const showEnlargedImage = ref(false);
const enlargedImageSrc = ref("");

onMounted(async () => {
  try {
    const res = await fetch(
      `/api/products/category/${encodeURIComponent(category)}`
    );
    if (res.ok) {
      products.value = await res.json();
    }
  } catch (err) {
    console.error("Error fetching products by category", err);
  }
});

function fullImagePath(path) {
  if (!path) return "";
  return "http://localhost:8000" + path.replace("//", "/");
}

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
  } else {
    let guestCart = JSON.parse(localStorage.getItem("guestCart") || "[]");
    const index = guestCart.findIndex((item) => item.product_id === productId);
    if (index !== -1) {
      guestCart[index].quantity += 1;
    } else {
      guestCart.push({ product_id: productId, quantity: 1 });
    }
    localStorage.setItem("guestCart", JSON.stringify(guestCart));
    modalMessage.value = "Added successfully";
    modalType.value = "success";
  }
  showModal.value = true;
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
.w3-content {
  margin: 0 auto;
  max-width: 1200px;
  margin-bottom: 50px;
}
@media (min-width: 640px) {
  .w3-content {
    margin-left: 300px;
    margin-right: auto;
  }
}
.category-title {
  margin-top: 50px;
  padding: 10px;
  font-size: 1.8rem;
  font-weight: bold;
}
.product-card {
  position: relative;
}
.product-container {
  position: relative;
  text-align: center;
}
.enlarge-on-hover {
  max-width: 80%;
  height: auto;
  display: block;
  margin: 0 auto;
  transition: transform 0.3s;
  cursor: pointer;
}
.enlarge-on-hover:hover {
  transform: scale(1.05);
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
  padding: 8px 12px;
  border-radius: 5px;
  cursor: pointer;
  z-index: 210;
}
</style>
