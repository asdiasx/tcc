<script lang="ts">
import { defineComponent } from 'vue'
import api from '../http.ts'
import '../models/Notification.ts'

export default defineComponent({
    props: {
        notification: {
            type: Object,
            required: true
        }
    },
    methods: {
        async handleDeleteButtonClick() {
            try {
                await api.delete(`/notifications/${this.notification.id}`);
                this.$emit('callUpdateNotifications')
            } catch (error) {
                console.error("Error deleting notification: ", error);
            }
        }
    }
})
</script>

<template>
    <div class="container px-0">
        <div class="card mb-2">
            <div class="card-body">

                <div class="row">
                    <div class="col">
                        <pre class="card-text">{{ notification.message }}</pre>
                    </div>
                    <div class="col-3 custom-right-align text-right me-3">
                        <i @click="handleDeleteButtonClick" class="fa-solid fa-trash-can fa-2x"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped>
.count {
    font-size: 0.6rem;
    position: relative;
    bottom: 0px;
}

.custom-right-align {
    flex: 0 0 0;
}
</style>
