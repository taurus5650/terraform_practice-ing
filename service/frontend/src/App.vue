<template>
  <div id="app" class="container">
    <h1> Terraform Practice 2025 </h1>

    <button @click="getHelloWorld">Fetch API</button>

    <div v-if="message" class="api-box">
      <p>API response:</p>
      <h2>{{ message }}</h2>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'

const message = ref('')

const getHelloWorld = async () => {
  try {
    const response = await fetch('/api/hello_world')
    const data = await response.json()
    message.value = data.message
  } catch (e) {
    message.value = 'Error fetching API'
  }
}
</script>

<style>
.container {
  max-width: 600px;
  margin: 50px auto;
  text-align: center;
  font-family: sans-serif;
}

button {
  padding: 10px 20px;
  font-size: 16px;
  cursor: pointer;
}

.api-box {
  margin-top: 20px;
  padding: 20px;
  border: 2px solid #4caf50;
  border-radius: 10px;
  background-color: #e8f5e9;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.api-box p {
  margin: 0;
  color: #2e7d32;
  font-weight: bold;
}

.api-box h2 {
  margin: 10px 0 0;
  color: #1b5e20;
}
</style>
