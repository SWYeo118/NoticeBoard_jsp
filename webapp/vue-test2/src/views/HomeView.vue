<template>
  <div class="home">
    <img alt="Vue logo" src="../assets/logo.png" />
    <file msg="Welcome to Your Vue.js App" />
  </div>
</template>

<script>
// @ is an alias to /src
import file from "@/components/HelloWorld.vue";

export default {
  name: "HomeView",
  components: {
    file,
  },
};
</script>
