<template>
  <div class="checkout-container">
    <h1 class="checkout-title">Checkout</h1>

    <!-- Krok 1: Dane wysyłki -->
    <div v-if="currentStep === 1 && !cartEmpty" class="form-step">
      <h2>Shipping Details</h2>
      <form @submit.prevent="goToNextStep">
        <div class="form-group">
          <label for="first_name">First Name:</label>
          <input
            type="text"
            id="first_name"
            v-model="shipping.first_name"
            required />
        </div>
        <div class="form-group">
          <label for="last_name">Last Name:</label>
          <input
            type="text"
            id="last_name"
            v-model="shipping.last_name"
            required />
        </div>
        <div class="form-group">
          <label for="address">Address:</label>
          <input type="text" id="address" v-model="shipping.address" required />
        </div>
        <div class="form-group">
          <label for="city">City:</label>
          <input type="text" id="city" v-model="shipping.city" required />
        </div>
        <div class="form-group">
          <label for="state">State:</label>
          <input type="text" id="state" v-model="shipping.state" required />
        </div>
        <div class="form-group">
          <label for="postal_code">Postal Code:</label>
          <input
            type="text"
            id="postal_code"
            v-model="shipping.postal_code"
            placeholder="e.g. 37-415"
            pattern="^\d{2}-\d{3}$"
            title="Postal code must be in the format XX-XXX (e.g. 37-415)"
            required />
        </div>
        <div class="form-group">
          <label for="country">Country:</label>
          <input type="text" id="country" v-model="shipping.country" required />
        </div>
        <div class="form-group">
          <label for="phone">Phone:</label>
          <input
            type="text"
            id="phone"
            v-model="shipping.phone"
            placeholder="9 digits"
            pattern="^\d{9}$"
            title="Phone number must be exactly 9 digits"
            required />
        </div>
        <div class="button-group">
          <button type="submit" class="primary-btn">Next Step</button>
        </div>
      </form>
    </div>

    <!-- Krok 2: Dane faktury -->
    <div v-else-if="currentStep === 2 && !cartEmpty" class="form-step">
      <h2>Invoice Details</h2>
      <form @submit.prevent="goToNextStep">
        <div class="form-group">
          <label for="company_name">Company Name:</label>
          <input
            type="text"
            id="company_name"
            v-model="invoice.company_name"
            required />
        </div>
        <div class="form-group">
          <label for="tax_id">Tax ID:</label>
          <input type="text" id="tax_id" v-model="invoice.tax_id" required />
        </div>
        <div class="form-group">
          <label for="inv_email">Email:</label>
          <input type="email" id="inv_email" :value="userEmail" disabled />
        </div>
        <div class="form-group">
          <label for="inv_address">Address:</label>
          <input
            type="text"
            id="inv_address"
            v-model="invoice.address"
            required />
        </div>
        <div class="form-group">
          <label for="inv_city">City:</label>
          <input type="text" id="inv_city" v-model="invoice.city" required />
        </div>
        <div class="form-group">
          <label for="inv_state">State:</label>
          <input type="text" id="inv_state" v-model="invoice.state" required />
        </div>
        <div class="form-group">
          <label for="inv_postal_code">Postal Code:</label>
          <input
            type="text"
            id="inv_postal_code"
            v-model="invoice.postal_code"
            placeholder="e.g. 37-415"
            pattern="^\d{2}-\d{3}$"
            title="Postal code must be in the format XX-XXX (e.g. 37-415)"
            required />
        </div>
        <div class="form-group">
          <label for="inv_country">Country:</label>
          <input
            type="text"
            id="inv_country"
            v-model="invoice.country"
            required />
        </div>
        <div class="form-group checkbox-group">
          <input
            type="checkbox"
            id="sameAsShipping"
            v-model="copyShipping"
            @change="copyShippingDetails" />
          <label for="sameAsShipping">Use shipping details</label>
        </div>
        <div class="button-group">
          <button type="button" class="secondary-btn" @click="goToPreviousStep">
            Back
          </button>
          <button type="submit" class="primary-btn">Next Step</button>
        </div>
      </form>
    </div>

    <!-- Krok 3: Dane płatności -->
    <div v-else-if="currentStep === 3 && !cartEmpty" class="form-step">
      <h2>Payment Details</h2>
      <form @submit.prevent="submitCheckout">
        <div class="form-group">
          <label for="card_number">Card Number:</label>
          <input
            type="text"
            id="card_number"
            v-model="payment.card_number"
            placeholder="16 digits"
            pattern="^\d{16}$"
            title="Card number must be exactly 16 digits (e.g. 1234123412341234)"
            maxlength="16"
            required />
        </div>
        <div class="form-group">
          <label for="card_holder">Card Holder:</label>
          <input
            type="text"
            id="card_holder"
            v-model="payment.card_holder"
            required />
        </div>
        <div class="form-group">
          <label for="expiration_date">Expiration Date (MM/YY):</label>
          <input
            type="text"
            id="expiration_date"
            v-model="payment.expiration_date"
            placeholder="MM/YY"
            pattern="(0[1-9]|1[0-2])\/\d{2}"
            title="Expiration date must be in MM/YY format and not in the past"
            required />
        </div>
        <div class="form-group">
          <label for="ccv">CCV:</label>
          <input
            type="text"
            id="ccv"
            v-model="payment.ccv"
            placeholder="3 digits"
            pattern="^\d{3}$"
            title="CCV must be exactly 3 digits (e.g. 123)"
            maxlength="3"
            required />
        </div>
        <div class="button-group">
          <button type="button" class="secondary-btn" @click="goToPreviousStep">
            Back
          </button>
          <button type="submit" class="primary-btn">Submit Payment</button>
        </div>
      </form>
    </div>

    <!-- Modal -->
    <div v-if="showModal" class="modal-overlay" @click="closeModal">
      <div class="modal-content" :class="modalType" @click.stop>
        <p>{{ modalMessage }}</p>
        <button class="modal-close" @click="closeModal">Close</button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive, computed, onMounted } from "vue";
import { useRouter } from "vue-router";
import { useAuthStore } from "@/stores/auth";

const router = useRouter();
const authStore = useAuthStore();
const userEmail = computed(() => (authStore.user ? authStore.user.email : ""));

const currentStep = ref(1);
const copyShipping = ref(false);
const cartEmpty = ref(false);

const shipping = reactive({
  first_name: "",
  last_name: "",
  address: "",
  city: "",
  state: "",
  postal_code: "",
  country: "",
  phone: "",
});
const invoice = reactive({
  company_name: "",
  tax_id: "",
  address: "",
  city: "",
  state: "",
  postal_code: "",
  country: "",
});
const payment = reactive({
  card_number: "",
  card_holder: "",
  expiration_date: "",
  ccv: "",
});
const showModal = ref(false);
const modalMessage = ref("");
const modalType = ref("");

function goToNextStep() {
  if (currentStep.value === 2 && copyShipping.value) {
    invoice.address = shipping.address;
    invoice.city = shipping.city;
    invoice.state = shipping.state;
    invoice.postal_code = shipping.postal_code;
    invoice.country = shipping.country;
  }
  currentStep.value++;
}

function goToPreviousStep() {
  currentStep.value--;
}

function copyShippingDetails() {
  if (copyShipping.value) {
    invoice.address = shipping.address;
    invoice.city = shipping.city;
    invoice.state = shipping.state;
    invoice.postal_code = shipping.postal_code;
    invoice.country = shipping.country;
  }
}

async function submitCheckout() {
  if (!authStore.user) {
    openModal("You must be logged in to complete purchase", "error");
    return;
  }
  // Sprawdzenie daty wygaśnięcia karty
  const [expMonth, expYear] = payment.expiration_date.split("/");
  const currentDate = new Date();
  const currentMonth = currentDate.getMonth() + 1;
  const currentYear = parseInt(currentDate.getFullYear().toString().slice(-2));
  if (
    parseInt(expYear) < currentYear ||
    (parseInt(expYear) === currentYear && parseInt(expMonth) < currentMonth)
  ) {
    openModal("Card expiration date cannot be in the past", "error");
    return;
  }
  const payload = {
    shipping: { ...shipping },
    invoice: { ...invoice, email: userEmail.value },
    payment: { ...payment },
  };
  try {
    const res = await fetch("/api/checkout", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        authorization: `Bearer ${localStorage.getItem("token")}`,
      },
      body: JSON.stringify(payload),
    });
    const data = await res.json();
    if (res.ok) {
      openModal("Purchase successful!", "success");
      router.push({ name: "home" });
    } else {
      openModal(data.message || "Error processing checkout", "error");
    }
  } catch (error) {
    openModal("Error processing checkout", "error");
  }
}

function openModal(message, type = "error") {
  modalMessage.value = message;
  modalType.value = type;
  showModal.value = true;
}

function closeModal() {
  showModal.value = false;
  modalMessage.value = "";
  modalType.value = "";
}

// Funkcja sprawdzająca zawartość koszyka
async function checkCart() {
  let empty = true;
  if (authStore.user) {
    try {
      const res = await fetch("/api/cart", {
        headers: {
          authorization: `Bearer ${localStorage.getItem("token")}`,
        },
      });
      if (res.ok) {
        const data = await res.json();
        if (data && data.length > 0) {
          empty = false;
        }
      }
    } catch (error) {
      console.error("Error fetching cart", error);
    }
  } else {
    // Dla gościa pobieramy z localStorage
    const guestCart = JSON.parse(localStorage.getItem("guestCart") || "[]");
    if (guestCart.length > 0) {
      empty = false;
    }
  }
  return empty;
}

onMounted(async () => {
  if (await checkCart()) {
    cartEmpty.value = true;
    openModal("Cart is empty", "error");
    setTimeout(() => {
      router.push({ name: "cart" });
    }, 3000);
  }
});
</script>

<style scoped>
.checkout-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
  font-family: Arial, sans-serif;
}
@media (min-width: 640px) {
  .checkout-container {
    margin-left: 300px;
    margin-right: auto;
  }
}
@media (min-width: 950px) {
  .form-step {
    min-width: 600px;
  }
}
.checkout-title {
  text-align: center;
  font-size: 2.5rem;
  margin-bottom: 20px;
}
.form-step {
  margin-bottom: 40px;
  background: #fff;
  padding: 20px;
  border: 1px solid #ccc;
  border-radius: 8px;
}
.form-group {
  margin-bottom: 15px;
  display: flex;
  flex-direction: column;
}
.form-group label {
  margin-bottom: 5px;
  font-weight: bold;
}
.form-group input[type="text"],
.form-group input[type="number"],
.form-group input[type="email"] {
  padding: 10px;
  font-size: 1rem;
  border: 1px solid #ccc;
  border-radius: 4px;
}

/* Stylizacja dla disabled input */
.form-group input[disabled] {
  background-color: rgba(128, 128, 128, 0.8);
  color: #fff;
  cursor: not-allowed;
}

.checkbox-group {
  display: flex;
  align-items: center;
}
.checkbox-group input[type="checkbox"] {
  margin-right: 10px;
}
.button-group {
  display: flex;
  justify-content: space-between;
  margin-top: 20px;
}
.primary-btn {
  padding: 10px 20px;
  background-color: #000;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-weight: 600;
  transition: background 0.3s;
}
.primary-btn:hover {
  background-color: #333;
}
.secondary-btn {
  padding: 10px 20px;
  background-color: #ccc;
  color: #000;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-weight: 600;
  transition: background 0.3s;
}
.secondary-btn:hover {
  background-color: #bbb;
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
</style>
