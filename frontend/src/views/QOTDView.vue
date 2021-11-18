<template>
    <QOTDComponent/>
</template>

<script lang="ts">
import { defineComponent } from 'vue'
import QOTDComponent from '@/components/QOTDComponent.vue'

export default defineComponent({
    setup() {
        console.log('Setting up QOTDView.vue')
    },
    components: {
        QOTDComponent
    }
})
</script>
