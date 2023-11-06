<script lang="ts">
import { defineComponent } from 'vue'
import api from '../http.ts'
import FormComment from './FormComment.vue'

export default defineComponent({
    components: {
        FormComment
    },
    data() {
        return {
            post_id: String(this.$route.params.postId),
        }
    },
    methods: {
        async handleSaveEvent(comment: Comment) {
            try {
                await api.post(`/posts/${this.post_id}/comments`, { body: comment.body });

                this.$router.push({ name: 'postDetails', params: { postId: this.post_id } })
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
            <h3>New Comment</h3>
        </div>
        <FormComment :post_id="post_id" @save-event="handleSaveEvent" />
    </div>
</template>

<style scoped></style>
