<script lang="ts">
import { defineComponent } from 'vue'
import api from '../http.ts'

export default defineComponent({
    data() {
        return {
            comment: {} as Comment
        }
    },
    props: {
        post_id: {
            type: String,
            required: true
        },
        comment_id: {
            type: String,
        }
    },
    methods: {
        async loadComment() {
            try {
                const response = await api.get(`/posts/${this.post_id}/comments/${this.comment_id}`);
                this.comment = response.data as Comment;

            } catch (error) {
                console.error("Error loading comment", error);
            }
        },
        handleSaveButtonClick(e: Event) {
            e.preventDefault();
            this.$emit('save-event', this.comment);
        },
        handleReturnButtonClick(e: Event) {
            e.preventDefault();

            this.$router.push({ name: 'postDetails', params: { postId: this.post_id } })
        },
    },
    async mounted() {
        if (this.comment_id) {
            await this.loadComment()
        }
    }
})
</script>

<template>
    <form>
        <div class="mb-3">
            <label for="body" class="form-label">Body</label>
            <textarea v-model="comment.body" class="form-control" id="body" rows="3"></textarea>
        </div>
        <div class="d-flex">
            <button @click="handleSaveButtonClick" class="btn btn-primary btn-style me-2">Save</button>
            <button @click="handleReturnButtonClick" class=" btn btn-primary btn-style">Return</button>
        </div>
    </form>
</template>

<style scoped></style>
