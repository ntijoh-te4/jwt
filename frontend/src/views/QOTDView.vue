<template>
    <Suspense>
        <template #default>
            <QOTDComponent/>
        </template>
        <template #fallback>
            <span>Fetching Quote of the Day...</span>
        </template>
    </Suspense>
</template>

<script lang="ts">
import { defineComponent } from 'vue'
import QOTDComponent from '@/components/QOTDComponent.vue'
import axios from 'axios'

export default defineComponent({
    setup() {
        const tmp = ''
    },
    components: {
        QOTDComponent
    }
})
</script>
