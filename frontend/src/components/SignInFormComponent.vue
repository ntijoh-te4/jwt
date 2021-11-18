<template>
    <span>{{message}}</span>
    <form @submit.prevent="signIn" action="#" class="sign-in">
        <input name="username" type="text" placeholder="username">
        <br>
        <input name="password" type="password" placeholder="password">
        <br>
        <button type="submit">Sign In</button>
    </form>
</template>

<script lang="ts">
import { computed, defineComponent} from 'vue'
import { useRouter } from 'vue-router'
import { useStore } from 'vuex'

export default defineComponent({
    setup() {
        console.log("Setting up SingInFormComponent.vue")
        const store = useStore()
        const router = useRouter()
        const message = computed(() => store.getters.authenticationMessage)
        async function signIn(event: Event) {
            const target = event.target as HTMLFormElement
            const formData = new FormData(target)
            const credentials = Object.fromEntries([...formData])
            await store.dispatch('signIn', credentials )
            router.push('/users')
        }   

        return {signIn, message}
    },
})
</script>
