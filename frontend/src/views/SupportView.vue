<template>
  <div class="page-container">
    <h1 class="page-title">Support</h1>
    <p class="intro">
      Welcome to our Support page. We are here to help you with any issues you
      may encounter.
    </p>
    <div class="support-info">
      <h2>Contact Our Support Team</h2>
      <p>
        You can reach us via email at
        <a href="mailto:info@ideo.pl"> info@ideo.pl</a>
        or call us at <strong>+48 17 860 21 86</strong>.
      </p>
      <p>
        For immediate assistance, use our live chat available on our website
        during business hours.
      </p>
    </div>
    <div class="help-guides">
      <h2>Helpful Guides</h2>
      <div class="guide-cards">
        <div class="guide-card">
          <h3>Getting Started</h3>
          <p>
            Learn how to set up your account and make the most of our services.
          </p>
          <a href="/help" class="guide-link">Read More</a>
        </div>
        <div class="guide-card">
          <h3>Account Management</h3>
          <p>
            Discover how to update your profile, change your password, and
            manage your subscriptions.
          </p>
          <a href="/help" class="guide-link">Read More</a>
        </div>
        <div class="guide-card">
          <h3>Troubleshooting</h3>
          <p>
            Find answers to common issues and learn how to resolve them quickly.
          </p>
          <a href="/help" class="guide-link">Read More</a>
        </div>
      </div>
    </div>
    <div class="contact-section">
      <h2>Need further assistance?</h2>
      <p>
        If you cannot find the answer you're looking for, please contact our
        support team at
        <a href="mailto:info@ideo.pl">info@ideo.pl</a>
      </p>
    </div>
  </div>
</template>

<script setup>
import { ref } from "vue";
const supportTopics = ref([]);
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
  margin-bottom: 20px;
  font-weight: bold;
}
.intro {
  font-size: 1.1rem;
  margin-bottom: 30px;
}
.support-info {
  background-color: #f7f7f7;
  padding: 20px;
  border-radius: 5px;
  margin-bottom: 30px;
}
.support-info h2 {
  font-size: 1.8rem;
  margin-bottom: 10px;
}
.support-info a {
  color: #007bff;
  text-decoration: none;
}
.support-info a:hover {
  text-decoration: underline;
}
.help-guides {
  margin-bottom: 30px;
}
.help-guides h2 {
  font-size: 1.8rem;
  margin-bottom: 20px;
}
.guide-cards {
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
}
.guide-card {
  flex: 1 1 250px;
  border: 1px solid #ccc;
  border-radius: 5px;
  padding: 15px;
  background-color: #fff;
  transition: box-shadow 0.3s;
}
.guide-card:hover {
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
}
.guide-card h3 {
  font-size: 1.4rem;
  margin-bottom: 10px;
}
.guide-card p {
  font-size: 0.95rem;
  margin-bottom: 15px;
}
.guide-link {
  color: #007bff;
  text-decoration: none;
  font-weight: bold;
}
.guide-link:hover {
  text-decoration: underline;
}
.contact-section {
  margin-top: 40px;
  text-align: center;
}
.contact-section h2 {
  font-size: 1.8rem;
  margin-bottom: 10px;
}
.contact-section a {
  color: #007bff;
  text-decoration: none;
}
.contact-section a:hover {
  text-decoration: underline;
}
</style>
