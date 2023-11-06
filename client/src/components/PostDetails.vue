<script lang="ts">
import { defineComponent } from 'vue'
import api from '../http.ts'
import '../models/Post.ts'
import '../models/Comment.ts'
import Post from './Post.vue'
import Comment from './Comment.vue'

export default defineComponent({
    components: {
        Post,
        Comment
    },
    props: {
        postId: {
            type: String,
            required: true
        }
    },
    data() {
        return {
            post: {} as Post,
            comments: [] as Comment[]
        }
    },
    methods: {
        async loadPost() {
            try {
                const response = await api.get(`/posts/${this.postId}`);
                this.post = response.data as Post;
            } catch (error) {
                console.error("Error loading posts:", error);
            }
        },
        async loadComments() {
            try {
                const response = await api.get(`/posts/${this.postId}/comments`);
                this.comments = response.data as Comment[];
            } catch (error) {
                console.error("Error loading comments:", error);
            }
        },
        async updateComments() {
            await this.loadComments()
        },
        handleBackButtonClick(e: Event) {
            e.preventDefault();
            this.$router.push('/posts');
        },
        handleNewCommmentButtonClick(e: Event) {
            e.preventDefault();
            this.$router.push(`/newcomment/${this.postId}`);
        }
    },
    async mounted() {
        await this.loadPost()
        await this.loadComments()
    }
})
</script>

<template>
    <div class="container px-2">
        <div class="row mx-0">
            <h1 class="col mb-2 d-flex justify-content-between px-0">Post Details</h1>
            <div class="col-7 custom-right-align d-flex justify-content-end mx-0 px-0 ">
                <button @click="handleNewCommmentButtonClick" class=" btn btn-primary btn-sm me-2 mt-2 mb-1"
                    style="width: 7rem; height: 35px;" type="button">Add
                    comment</button>

                <button @click="handleBackButtonClick" class="btn btn-primary btn-sm mt-2 mb-1"
                    style="width: 7rem;  height: 35px;" type="button">Back to
                    posts</button>
            </div>
        </div>
        <Post :post="post" />
        <p v-if="comments.length < 1" class="text-muted mt-5">No comments yet. Click "Add comment" button to add a comment
            to this post</p>
        <div v-if="comments.length > 0">
            <h3> Comments </h3>

            <div v-for="comment in comments">
                <Comment @callUpdateComments="updateComments" :comment="comment" :key="comment.id" />
            </div>
        </div>
    </div>
</template>

<style scoped></style>
