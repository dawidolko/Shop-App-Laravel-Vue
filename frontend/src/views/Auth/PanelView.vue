<template>
  <div class="panel-container">
    <h1>User Panel</h1>
    <p>
      This is your personal panel. Below are your purchased products grouped by
      day:
    </p>

    <div
      v-for="(purchases, day) in groupedPurchases"
      :key="day"
      class="purchase-day-group">
      <h2>{{ day }}</h2>
      <table class="purchase-table">
        <thead>
          <tr>
            <th>Image</th>
            <th>Name</th>
            <th class="hide">Quantity</th>
            <th class="hide">Price</th>
            <th class="hide">Purchased At</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="purchase in purchases" :key="purchase.id">
            <td>
              <img
                :src="fullImagePath(purchase.product.thumbnail)"
                alt="Product Image"
                class="purchase-item-image" />
            </td>
            <td>
              <router-link
                :to="{ name: 'product', params: { id: purchase.product.id } }">
                {{ purchase.product.title }}
              </router-link>
            </td>
            <td class="hide">{{ purchase.quantity }}</td>
            <td class="hide">${{ purchase.price }}</td>
            <td class="hide">{{ formatDate(purchase.created_at) }}</td>
            <td>
              <button
                class="details-btn"
                @click="showShippingDetails(purchase)">
                Shipping Details
              </button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>

    <p v-if="!hasPurchases" style="text-align: center; font-size: 1.5rem">
      You have no purchased products.
    </p>

    <!-- Modal for shipping details -->
    <div v-if="showModal" class="modal-overlay" @click="closeModal">
      <div class="modal-content" :class="modalType" @click.stop>
        <h3>Shipping Details</h3>
        <div v-if="currentShipping">
          <p>
            <strong>Name:</strong> {{ currentShipping.first_name }}
            {{ currentShipping.last_name }}
          </p>
          <p><strong>Address:</strong> {{ currentShipping.address }}</p>
          <p><strong>City:</strong> {{ currentShipping.city }}</p>
          <p><strong>State:</strong> {{ currentShipping.state }}</p>
          <p><strong>Postal Code:</strong> {{ currentShipping.postal_code }}</p>
          <p><strong>Country:</strong> {{ currentShipping.country }}</p>
          <p><strong>Phone:</strong> {{ currentShipping.phone }}</p>
        </div>
        <div v-else>
          <p>No shipping details available.</p>
        </div>
        <button class="modal-close" @click="closeModal">Close</button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, computed } from "vue";
import { useAuthStore } from "@/stores/auth";

const authStore = useAuthStore();
const purchases = ref([]);

const showModal = ref(false);
const modalType = ref("success");
const currentShipping = ref(null);

function fullImagePath(path) {
  if (!path) return "";
  return "http://localhost:8000" + path.replace("//", "/");
}

function formatDate(dateStr) {
  if (!dateStr) return "";
  const date = new Date(dateStr);
  return date.toLocaleString();
}

async function fetchPurchases() {
  if (!authStore.user) {
    openModal("You must be logged in", "error");
    return;
  }
  try {
    const res = await fetch("/api/purchases", {
      headers: {
        authorization: `Bearer ${localStorage.getItem("token")}`,
      },
    });
    const data = await res.json();
    if (!res.ok) {
      openModal(data.message || "Error fetching purchases", "error");
      return;
    }
    purchases.value = data;
  } catch (error) {
    openModal("Error fetching purchases", "error");
  }
}

function openModal(message, type = "error") {
  modalType.value = type;
  showModal.value = true;
}

function closeModal() {
  showModal.value = false;
  currentShipping.value = null;
}

function showShippingDetails(purchase) {
  currentShipping.value = purchase.shipping || null;
  openModal("", "success");
}

const groupedPurchases = computed(() => {
  const groups = {};
  purchases.value.forEach((purchase) => {
    const date = new Date(purchase.created_at).toLocaleDateString();
    if (!groups[date]) {
      groups[date] = [];
    }
    groups[date].push(purchase);
  });
  return groups;
});

const hasPurchases = computed(
  () => Object.keys(groupedPurchases.value).length > 0
);

onMounted(() => {
  fetchPurchases();
});
</script>

<style scoped>
.panel-container {
  margin: 0 auto;
  margin-bottom: 170px;
  font-family: Arial, sans-serif;
  padding: 20px;
}
.hide {
  display: flex;
  flex-direction: column;
  align-items: center;
}
@media screen and (min-width: 640px) {
  .panel-container {
    margin-left: 300px;
  }
}

@media screen and (max-width: 900px) {
  .purchase-table {
    max-width: 300px;
  }
  .hide {
    display: none;
  }
}

h1 {
  font-size: 2rem;
  text-align: center;
  margin-top: 50px;
}
.purchase-table {
  margin: 20px auto 0;
  border-collapse: collapse;
}
.purchase-table th,
.purchase-table td {
  border: 1px solid #ccc;
  padding: 10px;
  text-align: left;
}
.purchase-item-image {
  width: 70px;
  height: auto;
  border-radius: 4px;
  object-fit: cover;
}
.details-btn {
  padding: 6px 12px;
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.3s;
}
.details-btn:hover {
  background-color: #0056b3;
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
.modal-content.success {
  background-color: #d4edda;
  color: #155724;
}
.modal-content.error {
  background-color: #f8d7da;
  color: #721c24;
}
.modal-close {
  margin-top: 10px;
  padding: 6px 12px;
  border: none;
  background: #ccc;
  cursor: pointer;
}
.purchase-day-group {
  margin-bottom: 30px;
}
</style>
