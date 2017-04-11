<template lang='haml'>
  %li.row
    .col-sm-4.image
      %router-link{ "v-bind:to": "'/artworks/' + artwork.id" }
        %img.img{ "v-bind:src": "artwork.imageUrl" }
    .col-sm-5
      %router-link{ "v-bind:to": "'/artworks/' + artwork.id" }
        %h1 {{ artwork.title }}
      %p {{ artwork.year }}
      %p From {{ artwork.mediums }}
    .col
      %publisher.star{ "v-bind:artId": "artwork.id", "v-bind:published": "artwork.published", "v-on:publishingChanged": "toggleArtwork($event)" }
</template>

<script lang="coffee">
  import Publisher from './publisher.vue'

  export default {
    components:
      publisher: Publisher
    props:
      artwork:
        required: true
    methods:
      toggleArtwork: (artworkId) ->
        this.$emit('publishingChanged', artworkId)
  }
</script>

<style scoped lang='scss'>
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
