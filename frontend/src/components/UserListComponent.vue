<template>
    <UserCardcomponent v-for="user in response.data" v-bind:key="user.id" v-bind:user="user" />
</template>

<script lang="ts">
import { defineComponent, inject } from 'vue'
import {useRouter} from 'vue-router'
import { AxiosInstance } from 'axios'
import UserCardcomponent from '@/components/UserCardComponent.vue'

export default defineComponent({
    async setup() {
        const axios = inject('axios') as AxiosInstance
        const router = useRouter()
        //const token = localStorage.getItem('token')
            try {
            const response = await axios.get('/users')
            return {response}
            } catch {
                console.log('Not Authorized')
                await router.push('/')
            }
        
    },
    components: {
        UserCardcomponent
    }
})
</script>
