<template>
  <div class="error-container">
    <h1>404 - Page Not Found</h1>
    <p>This subpage doesn't seem to exist.</p>
    <p class="refresh">
      <router-link to="/">Back to main page</router-link>
    </p>
  </div>
</template>

<script setup></script>

<style scoped>
.error-container {
  text-align: center;
  margin-top: 100px;
  font-family: Arial, sans-serif;
  margin: 0 auto;
  max-width: 600px;
}

.error-container h1 {
  font-size: 3rem;
  margin-bottom: 20px;
  font-weight: bold;
  margin-top: 100px;
}

.error-container p {
  font-size: 2rem;
  margin-bottom: 100px;
}
.refresh {
  color: red;
  text-decoration: underline;
}
@media (min-width: 640px) {
  .error-container {
    margin-left: 300px;
  }
}
</style>
