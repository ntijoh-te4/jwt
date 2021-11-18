<template>
    <h1>Quote of the Day</h1>
    <div v-if="quote != null" class="quote">
        <h3>{{quote.quote}}</h3>
        <h4>{{quote.author}}</h4>
    </div>
    <div v-else>
        <span>Fetching quote...</span>
    </div>
</template>

<script lang="ts">

import { computed, defineComponent } from 'vue'
import { useStore } from 'vuex'

export default defineComponent({
    setup() {
        console.log('Setting up QOTDComponent.vue')
        const store = useStore()
        const quote = computed(() => store.getters.quote)
        store.dispatch('fetchQuote')

        return {quote }
    },
})
</script>
