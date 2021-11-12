<template>
    <form v-on:submit.prevent="signIn" action="#" class="sign-in">
        <span class="message" v-if="error != ''">{{error}}</span>
        <br>
        <input v-model="username" type="text" placeholder="username">
        <br>
        <input v-model="password" type="password" placeholder="password">
        <br>
        <button type="submit">Sign In</button>
    </form>
</template>

<script lang="ts">
import { AxiosInstance } from 'axios'
import { defineComponent, inject, ref } from 'vue'
import authenticated from '@/store'

export default defineComponent({
    setup() {
        console.log("Setting up SingInFormComponent.vue")
        const username = ref('')
        const password = ref('')
        const error = ref('')

        const axios = inject('axios') as AxiosInstance

        async function signIn() {
            try {
                const response = await axios.post('/users/signin', 
                                                  {username: username.value,
                                                   password: password.value})
                saveToken(response.data.token)
                setMessage('Sign in successful')
                username.value = ''
                password.value = ''

            } catch (error) {
                console.log(error)
                setMessage("Invalid username or password");
            }
        }

        function setMessage(message: string) {
            error.value = message
        }

        function saveToken(token: string) {
            authenticated.value = true
            localStorage.setItem('token', token)

        }

        return {username, password, error, signIn}
    },
})
</script>
