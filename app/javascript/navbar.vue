<template>
  <b-container class="p-0" fluid>
    <b-navbar type="dark" variant="info">
      <b-navbar-brand id="service_title" href="/">GO<ion-icon name="megaphone"></ion-icon></b-navbar-brand>
    </b-navbar>
  </b-container>
</template>

<script>
export default {
  name: 'Navbar'
}
</script>

<style>
@import url('https://fonts.googleapis.com/css?family=Sawarabi+Mincho&display=swap');

b-container {
  padding: 0px;
}

#service_title {
  font-family: 'Sawarabi Mincho', sans-serif;
  font-size: 30px;
}
</style>
