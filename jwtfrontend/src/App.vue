<script setup lang="ts">

import LoginComponent from './components/LoginComponent.vue';
</script>

<template>
  <h1>Login to get <em>Qote of the day</em></h1>
  <LoginComponent></LoginComponent>
</template>

<style>
  body {
    font-family: sans-serif;
  }
  h1, h2 {
    font-family: sans-serif;
    font-weight: 100;
    }
  code {
    padding: 1em;
    display: block;
    margin: 1em 0;
    background-color: salmon;
    overflow: scroll;
  }

  blockquote footer {
    font-style: italic;
    margin-top: 0.5em;
    margin-left: 1em;
  }
</style>

<style scoped></style>
