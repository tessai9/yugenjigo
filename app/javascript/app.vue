<template>
  <div>
    <p>{{ message }}</p>
    <div class="text-center my-3">
      <b-button v-b-tooltip.hover title="Tooltip content">Hover Me</b-button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'App',
  data: function () {
    return {
      message: "this message is from app.vue"
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
