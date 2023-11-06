<script setup lang="ts">
import MyHeader from './components/MyHeader.vue'
import MyFooter from './components/MyFooter.vue'
</script>

<template>
  <my-header />
  <main>
    <router-view />
  </main>
  <my-footer />
</template>

<style scoped></style>
