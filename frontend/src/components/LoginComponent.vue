<script setup lang="ts">

import { API_BASE_URL } from '../../config';

import { ref } from 'vue';
import { useUserStore } from '../stores/UserStore';
const username = ref("ola")
const password = ref("123")
const status = ref("");
const qotd = ref("");
const author = ref("");
const token = ref("");
const userStore = useUserStore();

async function signIn(){
    qotd.value = "";
    author.value = "";
    token.value = "";
    try {
        status.value = "Starting login";
        const response = await fetch(`${API_BASE_URL}/api/v1/users/signin `, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ username: username.value, password: password.value })
        });

        if (!response.ok) {
            status.value += " || Failed to login"
            throw new Error("Failed to log in: " + response);
        }

        status.value += " || Waiting for login";
        const data = await response.json();
        status.value += " || Are logged in";

        // Log the full response data to check for token
        console.log("API response data:", data);

        // Verify data structure and then call login if token exists
        if (data.token) {
            userStore.login(data.token);
            token.value = data.token;
        } else {
            console.error("No token in API response");
        }

        //Fetch Qote of the day
        status.value += " || Fetching QOTD"
        await userStore.fetchQotd();
        qotd.value = userStore.qotd;
        author.value = userStore.author;

        status.value += " || Got QOTD | done";

    } catch (error) {
        console.error("Login failed:", error);
        status.value += " || Login failed"
    }
}

</script>

<template>

    <div v-if="status">
        <code>{{ status }}</code>
    </div>

    <div v-if="token">
        <code>Signed in with JWT token: {{ token }}</code>
    </div>

    <hr><hr>

    <form @submit.prevent="signIn" action="#" class="sign-in">
        <input v-model="username" name="username" type="text" placeholder="username">
        <br>
        <input v-model="password" name="password" type="password" placeholder="password">
        <br>
        <button type="submit">Sign In</button>
    </form>

    <div v-if="qotd && author">
        <h2>Quote of the Day:</h2>
        <blockquote>{{ qotd }}
            <footer>– {{ author }}</footer>
        </blockquote>
    </div>

</template>

<style scoped>
</style>
