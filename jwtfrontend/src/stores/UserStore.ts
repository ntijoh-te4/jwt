
//const API_BASE_URL = "http://localhost:9292";

import { API_BASE_URL } from '../../config';

import { defineStore } from 'pinia'

export const useUserStore = defineStore('UserStore', {
    state: () => ({
        qotd: "",
        author: "",
        token: ""
    }),
    getters: {
        getQoute(state) {
            return state.qotd;
        },
    },
    actions: {
        async fetchQotd() {
            console.log("Fetching qotd: " + this.token);
            try {
                const response = await fetch(`${API_BASE_URL}/api/v1/qotd`, {
                    headers: {
                        'Authorization': `Bearer ${this.token}`
                    }
                });
                if (!response.ok)
                    throw new Error("Failed to fetch QOTD");

                const data = await response.json();
                this.qotd = data.qotd.quote;
                this.author = data.qotd.author;

                console.log("Got QOTD: " + this.qotd);
            } catch (error) {
                console.error("Error fetching QOTD:", error);
            }
        },
        login(token: string) {
            console.log("Token passed to login:", token);
            this.token = token;
            console.log("JWT Token set in store:", this.token);
        },
    },
});