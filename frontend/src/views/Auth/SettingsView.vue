<template>
  <main class="auth-container" style="margin-bottom: 170px">
    <h1 class="title">Update Profile</h1>
    <form @submit.prevent="submitUpdate" class="auth-form">
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
          type="password"
          placeholder="New password (optional)"
          v-model="formData.password"
          class="input-field" />
      </div>
      <div class="form-group">
        <input
          type="password"
          placeholder="Confirm new password"
          v-model="formData.password_confirmation"
          class="input-field" />
        <p v-if="errors.password" class="error">{{ errors.password[0] }}</p>
      </div>
      <button type="submit" class="primary-btn">Save changes</button>
    </form>

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

const authStore = useAuthStore();

const formData = reactive({
  name: authStore.user ? authStore.user.name : "",
  password: "",
  password_confirmation: "",
});

const errors = computed(() => authStore.errors || {});

const showModal = ref(false);
const modalMessage = ref("");
const modalType = ref("");

async function submitUpdate() {
  authStore.errors = {};
  try {
    const res = await fetch("/api/user/update", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        authorization: `Bearer ${localStorage.getItem("token")}`,
      },
      body: JSON.stringify({
        name: formData.name,
        password: formData.password,
        password_confirmation: formData.password_confirmation,
      }),
    });
    if (!res.ok) {
      const data = await res.json();
      if (data.errors) {
        authStore.errors = data.errors;
      }
      modalMessage.value = data.message || "Update failed";
      modalType.value = "error";
      showModal.value = true;
    } else {
      const data = await res.json();
      // zaktualizuj store user (odśwież)
      authStore.user = data.user;
      modalMessage.value = "Profile updated successfully";
      modalType.value = "success";
      showModal.value = true;
    }
  } catch (error) {
    modalMessage.value = "Error updating profile";
    modalType.value = "error";
    showModal.value = true;
  }
}

function closeModal() {
  showModal.value = false;
}
</script>

<style scoped>
.auth-container {
  margin: 0 auto;
  padding: 20px;
  font-family: Arial, sans-serif;
}

@media screen and (min-width: 640px) {
  .auth-container {
    margin-left: 300px !important;
  }
  .auth-container {
    width: none;
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
  min-width: 300px;
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
  min-width: 150px;
  border-radius: 4px;
  cursor: pointer;
}

.primary-btn:hover {
  background-color: #0056b3;
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
