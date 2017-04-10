<template lang='haml'>
  %li.row
    .col-sm-2.image
      %router-link{ "v-bind:to": "'/artworks/' + artwork.id" }
        %img.img{ "v-bind:src": "artwork['image-url']" }
    .col
      %router-link{ "v-bind:to": "'/artworks/' + artwork.id" }
        %h1 {{ artwork.title }}
      %p {{ artwork.year }}
      %p From {{ artwork.mediums }}
    .col
      %publisher.star{ "v-bind:artId": "artwork.id", "v-bind:published": "artwork.published", "v-on:publishingChanged": "updateArtwork($event)" }
</template>

<script lang="coffee">
  import Publisher  from './publisher.vue'

  export default {
    components:
      publisher: Publisher
    props:
      artwork:
        required: true
    methods:
      updateArtwork: (artworkId)->
        this.$emit('publishingChanged', artworkId)
  }
</script>

<style scoped lang='scss'>
  @import 'bootstrap/dist/css/bootstrap.css';
  @import 'bootstrap-vue/dist/bootstrap-vue.css';

  li {
    margin-bottom: 15px;
    a:hover, a:visited, a:link, a:active, a {
      text-decoration: none;
    }
  }
  h1 {
    font-size: 32px;
    font-style: oblique;
  }
  .image img {
    float: right;
  }
</style>
