<template>
  <main class="auth-container" style="margin-bottom: 100px">
    <h1 class="title">Register a new account</h1>
    <form @submit.prevent="submitRegister" class="auth-form">
      <div class="form-group">
        <input
          type="text"
          placeholder="Name"
          v-model="formData.name"
          class="input-field" />
        <p v-if="errors.name" class="error">{{ errors.name[0] }}</p>
      </div>
      <div class="form-group">
        <input
          type="text"
          placeholder="Email"
          v-model="formData.email"
          class="input-field" />
        <p v-if="errors.email" class="error">{{ errors.email[0] }}</p>
      </div>
      <div class="form-group">
        <input
          type="password"
          placeholder="Password"
          v-model="formData.password"
          class="input-field" />
        <p v-if="errors.password" class="error">{{ errors.password[0] }}</p>
      </div>
      <div class="form-group">
        <input
          type="password"
          placeholder="Confirm Password"
          v-model="formData.password_confirmation"
          class="input-field" />
      </div>
      <button type="submit" class="primary-btn">Register</button>
    </form>
    <div class="info-link">
      <p>
        Already have an account?
        <RouterLink :to="{ name: 'login' }" class="link"
          >Login here.</RouterLink
        >
      </p>
    </div>

    <!-- Modal -->
    <div v-if="showModal" class="modal-overlay" @click="closeModal">
      <div class="modal-content" :class="modalType" @click.stop>
        <p>{{ modalMessage }}</p>
        <button class="modal-close" @click="closeModal">Close</button>
      </div>
    </div>
  </main>
</template>

<script setup>
import { reactive, ref, computed } from "vue";
import { useAuthStore } from "@/stores/auth";
import { useRouter, RouterLink } from "vue-router";

const authStore = useAuthStore();
const router = useRouter();

const formData = reactive({
  name: "",
  email: "",
  password: "",
  password_confirmation: "",
});

const errors = computed(() => authStore.errors || {});

const showModal = ref(false);
const modalMessage = ref("");
const modalType = ref(""); // "error" lub "success"

async function submitRegister() {
  await authStore.authenticate("register", formData);
  if (Object.keys(authStore.errors).length > 0) {
    modalMessage.value = "Registration failed";
    modalType.value = "error";
    showModal.value = true;
  } else {
    modalMessage.value = "Registered successfully";
    modalType.value = "success";
    showModal.value = true;
    setTimeout(() => {
      showModal.value = false;
      router.push({ name: "home" });
    }, 2000);
  }
}

function closeModal() {
  showModal.value = false;
}
</script>

<style scoped>
.auth-container {
  width: 50%;
  margin: 0 auto;
  padding: 20px;
  font-family: Arial, sans-serif;
}

@media screen and (min-width: 640px) {
  .auth-container {
    margin-left: 300px !important;
  }
}

.title {
  text-align: center;
  font-size: 2em;
  margin-bottom: 20px;
}

.auth-form {
  display: flex;
  flex-direction: column;
  gap: 15px;
}

.form-group {
  display: flex;
  flex-direction: column;
}

.input-field {
  padding: 10px;
  font-size: 1em;
  border: 1px solid #ccc;
  border-radius: 4px;
}

.error {
  color: #ff0000;
  font-size: 0.8em;
  margin-top: 5px;
}

.primary-btn {
  padding: 10px;
  background-color: #007bff;
  color: #fff;
  font-size: 1em;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.primary-btn:hover {
  background-color: #0056b3;
}

.info-link {
  text-align: center;
  margin-top: 15px;
}

.info-link .link {
  color: #007bff;
  text-decoration: none;
  font-weight: bold;
}

.info-link .link:hover {
  text-decoration: underline;
}

/* Modal styles */
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
