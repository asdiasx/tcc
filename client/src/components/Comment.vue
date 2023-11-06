<script lang="ts">
import { defineComponent } from 'vue'
import api from '../http.ts'
import '../models/Comment.ts'

export default defineComponent({
    props: {
        comment: {
            type: Object,
            required: true
        }
    },
    methods: {
        handleEditButtonClick() {
            this.$router.push(`/editcomment/${this.comment.post_id}/${this.comment.id}`);
        },
        async handleDeleteButtonClick() {
            try {
                await api.delete(`/posts/${this.comment.post_id}/comments/${this.comment.id}`);
                this.$emit('callUpdateComments')
            } catch (error) {
                console.error("Error deleting comment:", error);
            }
        }
    }
})
</script>

<template>
    <div class="container px-0">
        <div class="card mb-2">
            <div class="card-body">
                <h5 class="card-title bottom-border pb-2">
                    Id: {{ comment.id }}
                </h5>
                <div class="row">
                    <div class="col">
                        <pre class="card-text">{{ comment.body }}</pre>
                    </div>
                    <div class="col-3 custom-right-align me-3">
                        <i @click="handleEditButtonClick" class="fa-solid fa-pen-to-square fa-2x mb-2"></i>
                        <i @click="handleDeleteButtonClick" class="fa-solid fa-trash-can fa-2x"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped>
.custom-right-align {
    flex: 0 0 0;
}
</style>
