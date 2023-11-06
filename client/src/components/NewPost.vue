<script lang="ts">
import { defineComponent } from 'vue'
import api from '../http.ts'
import FormPost from './FormPost.vue'

export default defineComponent({
    components: {
        FormPost
    },
    methods: {
        async handleSaveEvent(post: Post) {
            try {
                const res = await api.post('/posts', { title: post.title, body: post.body });

                const newPost = res.data as Post;

                this.$router.push({ name: 'postDetails', params: { postId: newPost.id } })
            } catch (error) {
                console.error("Error creating post", error);
            }
        },
    },
})
</script>

<template>
    <div class="container px-0">
        <div class="mb-3">
            <h3>New Post</h3>
        </div>
        <FormPost @save-event="handleSaveEvent" />
    </div>
</template>

<style scoped></style>
