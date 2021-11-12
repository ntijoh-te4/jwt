<template>
    <section class="user-card">
        <span>{{user.id}}: {{user.username}}</span>
    </section>
</template>

<script lang="ts">
import { defineComponent } from 'vue'

export default defineComponent({
    props: {
        user: {}   
    },
    setup() {
      console.log('Set up UserCardComponent.vue')  
    },
})
</script>
