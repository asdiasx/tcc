<script lang="ts">
export default {
    name: 'MyFooter',
}
</script>

<template>
    <footer class="footer bottom py-3 bg-dark">
        <div class="container centered">
            <span class="text-light">by Adriano Dias - 2023</span>
        </div>
    </footer>
</template>

<style>
.bottom {
    margin-top: auto;
    position: fixed;
    bottom: 0;
    width: 100%;
}

.centered {
    z-index: 99;
    display: flex;
    justify-content: center;
    align-items: center;
}
</style>