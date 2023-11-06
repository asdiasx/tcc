<script lang="ts">
import { defineComponent } from 'vue'
import api from '../http.ts'
import '../models/Notification.ts'
import Notification from './Notification.vue'

export default defineComponent({
    components: {
        Notification,
    },
    data() {
        return {
            notifications: [] as Notification[]
        }
    },
    methods: {
        async loadNotifications() {
            try {
                const response = await api.get("/notifications");
                this.notifications = response.data as Notification[];
            } catch (error) {
                console.error("Error loading notifications:", error);
            }
        },
        async updateNotifications() {
            await this.loadNotifications()
        },
    },
    async mounted() {
        await this.loadNotifications()
    }
})
</script>

<template>
    <div class="container px-2">
        <h1 class="col mb-2 px-0">Notifications</h1>

        <p v-if="notifications.length < 1" class="text-muted mt-5">No notifications here...</p>
        <div v-for="notification in notifications">
            <Notification @callUpdateNotifications="updateNotifications" :notification="notification"
                :key="notification.id" />
        </div>
    </div>
</template>

<style scoped></style>
