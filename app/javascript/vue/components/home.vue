<template lang='haml'>
  #app.container-fluid
    %ul.col-sm-6
      %artwork{ "v-for": "artwork in artworks", key: "artwork.id", "v-bind:artwork": "artwork", "v-on:publishingChanged": "updateArtwork($event)" }
    %paginator{ "url": "/api/artworks/", "event-name": "pageChange", "v-on:pageChange": "replaceArtworks($event)" }
</template>

<script lang="coffee">
  import Artwork  from './artworks/artwork.vue'
  import Paginator  from './utils/paginator.vue'

  export default {
    components:
      artwork: Artwork
      paginator: Paginator
    data: ()->
      artworks: []
    methods:
      replaceArtworks: (arts) ->
        this.$set(this, 'artworks', arts)
      updateArtwork: (artworkId)->
        artwork = (art for art in this.artworks when art.id is artworkId)[0]
        artwork.published = !artwork.published
  }
</script>

<style scoped lang='scss'>
  @import 'bootstrap/dist/css/bootstrap.css';
  @import 'bootstrap-vue/dist/bootstrap-vue.css';

  ul {
    padding: 0;
    margin: auto;
  }
</style>
