<template>
  <NavbarComponent />
  <router-view/>
</template>

<script lang="ts">
import { defineComponent } from 'vue'
import NavbarComponent from '@/components/NavbarComponent.vue'

export default defineComponent({
  setup() {
    console.log("Setting upp App.vue")
  },
  components: {
    NavbarComponent
  }
})
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
