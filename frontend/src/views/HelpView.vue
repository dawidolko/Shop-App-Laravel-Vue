<template>
  <div class="page-container">
    <h1>Help & FAQ</h1>
    <p>
      Welcome to the Help page. Here you'll find answers to frequently asked
      questions and useful guides to help you use our application.
    </p>
    <div class="faq-section">
      <div v-for="(faq, index) in faqs" :key="index" class="faq-item">
        <div class="faq-question" @click="toggleFaq(index)">
          <span>{{ faq.question }}</span>
          <i :class="faq.open ? 'fa fa-chevron-up' : 'fa fa-chevron-down'"></i>
        </div>
        <div v-show="faq.open" class="faq-answer">
          <p>{{ faq.answer }}</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from "vue";

const faqs = ref([
  {
    question: "How do I register an account?",
    answer:
      "To register, click on the Register link in the navigation bar and fill in your details. Once registered, you'll receive a confirmation email.",
    open: false,
  },
  {
    question: "How can I reset my password?",
    answer:
      "If you forgot your password, click the 'Forgot Password' link on the login page and follow the instructions to reset it.",
    open: false,
  },
  {
    question: "How do I add products to my cart?",
    answer:
      "Browse our products and click on the 'Add to cart' button. You can adjust the quantity in your cart before checking out.",
    open: false,
  },
  {
    question: "What payment methods are accepted?",
    answer:
      "We accept major credit cards and Amex. For more details, please check our payment section in the footer.",
    open: false,
  },
  {
    question: "How do I contact support?",
    answer:
      "If you need assistance, click on the Support link in the navigation menu or send us a message using the contact form in the footer.",
    open: false,
  },
  {
    question: "How can I update my profile information?",
    answer:
      "Go to the Settings page from your user panel and update your name, password, and other details.",
    open: false,
  },
]);

function toggleFaq(index) {
  faqs.value[index].open = !faqs.value[index].open;
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
  }
}
h1 {
  font-size: 2.5rem;
  margin-bottom: 20px;
}
.faq-section {
  margin-top: 30px;
}
.faq-item {
  border: 1px solid #ccc;
  border-radius: 5px;
  margin-bottom: 10px;
  overflow: hidden;
}
.faq-question {
  background-color: #f7f7f7;
  padding: 15px;
  cursor: pointer;
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-weight: bold;
}
.faq-answer {
  padding: 15px;
  background-color: #fff;
}
.faq-answer p {
  margin: 0;
}
.faq-question i {
  font-size: 1rem;
}
</style>
