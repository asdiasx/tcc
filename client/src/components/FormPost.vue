<script lang="ts">
import { defineComponent } from 'vue'
import api from '../http.ts'

export default defineComponent({
    data() {
        return {
            post: {} as Post
        }
    },
    props: {
        post_id: {
            type: String,
        }
    },
    methods: {
        async loadPost() {
            try {
                const response = await api.get(`/posts/${this.post_id}`);
                this.post = response.data as Post;

            } catch (error) {
                console.error("Error loading post", error);
            }
        },
        handleSaveButtonClick(e: Event) {
            e.preventDefault();
            this.$emit('save-event', this.post);
        },
        handleReturnButtonClick(e: Event) {
            e.preventDefault();

            this.$router.push({ name: 'posts' })
        },
    },
    async mounted() {
        if (this.post_id) {
            await this.loadPost()
        }
    }
})
</script>

<template>
    <form>
        <div class="mb-3">
            <label for="title" class="form-label">Title</label>
            <input v-model="post.title" class="form-control" id="title" />
        </div>

        <div class="mb-3">
            <label for="body" class="form-label">Body</label>
            <textarea v-model="post.body" class="form-control" id="body" rows="3"></textarea>
        </div>
        <div class="d-flex">
            <button @click="handleSaveButtonClick" class="btn btn-primary btn-style me-2">Save</button>
            <button @click="handleReturnButtonClick" class=" btn btn-primary btn-style">Return</button>
        </div>
    </form>
</template>

<style scoped></style>
