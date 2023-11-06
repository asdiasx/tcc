<script lang="ts">
import { defineComponent } from 'vue'
import api from '../http.ts'

export default defineComponent({
    data() {
        return {
            paragraph1: String,
            paragraph2: String
        }
    },
    methods: {
        async loadAbout() {
            try {
                const response = await api.get("/about");
                const data = response.data as any;
                this.paragraph1 = data.paragraph1 as any;
                this.paragraph2 = data.paragraph2 as any;
            } catch (error) {
                console.error("Error loading notifications:", error);
            }
        },
    },
    async mounted() {
        await this.loadAbout()
    }
})
</script>

<template>
    <div class="container p-3">
        <h1 class=" px-0 mb-4">About this app</h1>
        <div class="card mb-2">
            <div class="card-body">
                <pre> {{ paragraph1 }} </pre>
                <pre> {{ paragraph2 }} </pre>
            </div>
        </div>
    </div>
</template>

<style scoped></style>
