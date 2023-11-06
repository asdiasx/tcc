<script lang="ts">
import { defineComponent } from 'vue'
import api from '../http.ts'
import '../models/Post.ts'

export default defineComponent({
    props: {
        post: {
            type: Object,
            required: true
        }
    },
    computed: {
        isPagePosts() {
            return this.$route.path === '/posts'
        }
    },
    methods: {
        handleEditButtonClick() {
            this.$router.push(`/editpost/${this.post.id}`);
        },
        async handleDeleteButtonClick() {
            try {
                await api.delete(`/posts/${this.post.id}`);
                this.$emit('callUpdatePosts')
            } catch (error) {
                console.error("Error deleting post:", error);
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
                    <a class="link-underline link-underline-opacity-0"
                        :href="isPagePosts ? `/postdetails/${post.id}` : '#'">
                        {{ post.title }}
                    </a>
                </h5>
                <div class="row">
                    <div class="col">
                        <pre class="card-text">{{ post.body }}</pre>
                    </div>
                    <div class="col-3 custom-right-align text-right me-3" v-if="isPagePosts">
                        <i @click="handleEditButtonClick" class="fa-solid fa-pen-to-square fa-2x mb-2"></i>
                        <i @click="handleDeleteButtonClick" class="fa-solid fa-trash-can fa-2x"></i>
                    </div>
                    <span class="count">Comments: {{ post.commentsQty }}</span>
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
