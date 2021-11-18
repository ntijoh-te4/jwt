<template>
    <div id="nav">
        <router-link to="/">Home</router-link> |
        <router-link to="/qotd">Quote of the Day</router-link> |
        <router-link v-if="!authenticated" to="/signin">Sign In</router-link> 
        <router-link v-else to="/" v-on:click="signOut">Sign Out</router-link>
        <span v-if="authenticated"> | <router-link  to="/users">List Users</router-link></span>
        
  </div>
</template>

<script lang="ts">
import { computed, defineComponent } from 'vue'
import { useStore } from 'vuex'

export default defineComponent({
    setup() {
      console.log('Setting up NavbarComponent.vue')
      const store = useStore()
      const authenticated = computed(() => store.getters.isAuthenticated)
      console.log('Authenticated: ', authenticated.value)
      console.log(store.state.quote)

      async function signOut() {
        await store.dispatch('signOut')
      }

      return {authenticated, signOut}
  }
})
</script>

<style scoped>
#nav {
  padding: 30px;
}

a {
  font-weight: bold;
  color: #2c3e50;
}

a.router-link-exact-active {
  color: #42b983;
}
</style>
