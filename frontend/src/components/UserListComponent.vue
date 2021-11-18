<template>
    <UserCardcomponent v-for="user in users" v-bind:key="user.id" v-bind:user="user" />
</template>

<script lang="ts">
import { computed, defineComponent } from 'vue'
import UserCardcomponent from '@/components/UserCardComponent.vue'
import { useStore } from 'vuex'

export default defineComponent({
    setup() {
        console.log('Setting up UserListComponent.vue')
        const store = useStore()
        const users = computed(() => store.getters.users)
        store.dispatch('fetchUsers')
        return { users }
    },
    components: {
        UserCardcomponent
    }
})
</script>
