import { RouteRecordRaw, createRouter, createWebHistory } from 'vue-router'
import Posts from './components/Posts.vue'
import PostDetails from './components/PostDetails.vue'
import NewComment from './components/NewComment.vue'
import NewPost from './components/NewPost.vue'
import EditComment from './components/EditComment.vue'
import EditPost from './components/EditPost.vue'
import Notifications from './components/Notifications.vue'
import About from './components/About.vue'

const routes: Array<RouteRecordRaw> = [
  {
    path: '/',
    redirect: '/posts'
  },
  {
    path: '/posts',
    name: 'posts',
    component: Posts
  },
  {
    path: '/postdetails/:postId',
    name: 'postDetails',
    component: PostDetails,
    props: true
  },
  {
    path: '/newcomment/:postId',
    name: 'newComment',
    component: NewComment,
    props: true
  },
  {
    path: '/editcomment/:postId/:commentId',
    name: 'editComment',
    component: EditComment,
    props: true
  },
  {
    path: '/newpost/',
    name: 'newPost',
    component: NewPost,
  },
  {
    path: '/editpost/:postId',
    name: 'editPost',
    component: EditPost,
  },
  {
    path: '/notifications',
    name: 'notifications',
    component: Notifications,
  },
  {
    path: '/about',
    name: 'about',
    component: About,
  },
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router
