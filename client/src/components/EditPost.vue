<script lang="ts">
import { defineComponent } from 'vue'
import api from '../http.ts'
import FormPost from './FormPost.vue'

export default defineComponent({
    components: {
        FormPost
    },
    data() {
        return {
            post_id: String(this.$route.params.postId)
        }
    },
    methods: {
        async handleSaveEvent(post: Post) {
            try {
                await api.put(`/posts/${this.post_id}`, { title: post.title, body: post.body });

                this.$router.push({ name: 'postDetails', params: { postId: post.id } })
            } catch (error) {
                console.error("Error editing post", error);
            }
        },
    },
})
</script>

<template>
    <div class="container px-0">
        <div class="mb-3">
            <h3>Edit Post</h3>
        </div>
        <FormPost :post_id="post_id" @save-event="handleSaveEvent" />
    </div>
</template>

<style scoped></style>
