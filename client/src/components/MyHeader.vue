<script lang="ts">
export default {
    name: 'MyHeader',
}
</script>

<template>
    <nav class="navbar top navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="/posts">MyTcc (Client)</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/posts">Posts</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="/notifications">Notifications</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/about">About</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</template>

<style>
.top {
    z-index: 99;
    margin-bottom: auto;
    position: fixed;
    top: 0;
    width: 100%;
}
</style>
