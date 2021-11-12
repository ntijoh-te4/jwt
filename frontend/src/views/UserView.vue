<template>
    <Suspense>
        <template #default>
            <UserListComponent />
        </template>
        <template #fallback>
            <span>Loading...</span>
        </template>
    </Suspense>
</template>

<script lang="ts">
import { defineComponent } from 'vue'
import UserListComponent from '@/components/UserListComponent.vue'

export default defineComponent({
    setup() {
        console.log('Setup UserView.vue')
    },
    components: {
        UserListComponent
    }
})
</script>
