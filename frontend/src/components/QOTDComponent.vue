<template>
    <h1>Quote of the Day</h1>
    <h3>{{quote.quote}}</h3>
    <h4>{{quote.author}}</h4>
</template>

<script lang="ts">

import { AxiosInstance } from 'axios'
import { defineComponent, inject } from 'vue'

export default defineComponent({
    async setup() {
        const axios = inject('axios') as AxiosInstance

        const response = await axios.get('http://localhost:9292/api/v1/qotd')
        const quote = response.data.quote

        return {quote}
    },
})
</script>
