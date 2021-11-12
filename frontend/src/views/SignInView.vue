<template>    
    <SignInFormComponent />
</template>

<script lang="ts">
import { defineComponent } from 'vue'
import SignInFormComponent from '@/components/SignInFormComponent.vue'

export default defineComponent({
    setup() {
        console.log("Setting up SignInView.vue")
    },
    components: {
        SignInFormComponent
    }

})
</script>


