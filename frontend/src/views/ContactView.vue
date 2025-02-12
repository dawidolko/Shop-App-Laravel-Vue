<template>
  <div class="page-container">
    <h1 class="page-title">Contact</h1>
    <div class="form-section">
      <h2>Subscribe</h2>
      <p>Get special offers and VIP treatment:</p>
      <form @submit.prevent="submitSubscribe">
        <input
          type="text"
          placeholder="Enter e-mail"
          v-model="subscribeEmail"
          class="input-field" />
        <button type="submit" class="primary-btn">Subscribe</button>
      </form>
    </div>
    <div class="form-section">
      <h2>Contact Us</h2>
      <p>Send us a message for any inquiries:</p>
      <form @submit.prevent="submitContact">
        <input
          type="text"
          placeholder="Name"
          v-model="contactForm.name"
          class="input-field"
          required />
        <input
          type="text"
          placeholder="Email"
          v-model="contactForm.email"
          class="input-field"
          required />
        <input
          type="text"
          placeholder="Subject"
          v-model="contactForm.subject"
          class="input-field"
          required />
        <input
          type="text"
          placeholder="Message"
          v-model="contactForm.message"
          class="input-field"
          required />
        <button type="submit" class="primary-btn">Send</button>
      </form>
    </div>
    <div v-if="showModal" class="modal-overlay" @click="closeModal">
      <div class="modal-content" :class="modalType" @click.stop>
        <p>{{ modalMessage }}</p>
        <button class="modal-close" @click="closeModal">Close</button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from "vue";
import { useAuthStore } from "@/stores/auth";
const authStore = useAuthStore();
const subscribeEmail = ref("");
const contactForm = ref({ name: "", email: "", subject: "", message: "" });
const showModal = ref(false);
const modalMessage = ref("");
const modalType = ref("");
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
async function submitSubscribe() {
  if (!authStore.user) {
    openModal("You must be logged in to subscribe", "error");
    return;
  }
  try {
    const res = await fetch("/api/subscribe", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        authorization: `Bearer ${localStorage.getItem("token")}`,
      },
      body: JSON.stringify({ email: subscribeEmail.value }),
    });
    const data = await res.json();
    if (!res.ok) {
      openModal(data.message || "Subscription failed", "error");
    } else {
      openModal("Subscribed successfully!", "success");
      subscribeEmail.value = "";
    }
  } catch (error) {
    openModal("Error subscribing", "error");
  }
}
async function submitContact() {
  if (!authStore.user) {
    openModal("You must be logged in to send contact form", "error");
    return;
  }
  try {
    const res = await fetch("/api/contact", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        authorization: `Bearer ${localStorage.getItem("token")}`,
      },
      body: JSON.stringify({
        name: contactForm.value.name,
        email: contactForm.value.email,
        subject: contactForm.value.subject,
        message: contactForm.value.message,
      }),
    });
    const data = await res.json();
    if (!res.ok) {
      openModal(data.message || "Error sending message", "error");
    } else {
      openModal("Message sent successfully!", "success");
      contactForm.value = { name: "", email: "", subject: "", message: "" };
    }
  } catch (error) {
    openModal("Error sending message", "error");
  }
}
</script>

<style scoped>
.page-container {
  padding: 20px;
  font-family: Arial, sans-serif;
  margin: 0 auto;
  max-width: 1200px;
}
@media (min-width: 640px) {
  .page-container {
    margin-left: 300px;
    margin-right: auto;
  }
}
.page-title {
  font-size: 2.5rem;
  font-weight: bold;
  margin-bottom: 20px;
}
.form-section {
  margin-bottom: 40px;
}
.form-section h2 {
  font-size: 2rem;
  margin-bottom: 10px;
}
.form-section p {
  font-size: 1.1rem;
  margin-bottom: 15px;
}
.input-field {
  width: 100%;
  padding: 10px;
  font-size: 1em;
  border: 1px solid #ccc;
  border-radius: 4px;
  margin-bottom: 10px;
}
.primary-btn {
  background-color: #007bff;
  color: #fff;
  padding: 10px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 1em;
}
.primary-btn:hover {
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
  z-index: 999;
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
