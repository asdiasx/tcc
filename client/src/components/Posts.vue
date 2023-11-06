<script lang="ts">
import { defineComponent } from 'vue'
import api from '../http.ts'
import '../models/Post.ts'
import Post from './Post.vue'

export default defineComponent({
    components: {
        Post,
    },
    data() {
        return {
            posts: [] as Post[]
        }
    },
    methods: {
        async loadPosts() {
            try {
                const response = await api.get("/posts");
                this.posts = response.data as Post[];
            } catch (error) {
                console.error("Error loading posts:", error);
            }
        },
        async updatePosts() {
            await this.loadPosts()
        },
        async handleNewPostButtonClick() {
            this.$router.push('/newpost');
        }
    },
    async mounted() {
        await this.loadPosts()
    }
})
</script>

<template>
    <div class="container px-2">
        <div class="row d-flex justify-content-between mx-0">
            <h1 class="col mb-2 px-0">Posts</h1>
            <button @click="handleNewPostButtonClick" class="col-1 btn btn-primary btn-sm  mt-2 mb-1"
                style="width: 7rem;  height: 35px;" type="button">New post</button>
        </div>
        <p v-if="posts.length < 1" class="text-muted mt-5">No posts found, click "New post" button to create a post</p>
        <div v-for="post in posts">
            <Post @callUpdatePosts="updatePosts" :post="post" :key="post.id" />
        </div>
    </div>
</template>

<style scoped></style>
