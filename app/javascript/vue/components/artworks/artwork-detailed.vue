<template lang='haml'>
  .card.artwork.col-sm-6{ "v-if": "artwork" }
    %img.img{ "v-bind:src": "artwork['large-image-url']" }
    .card-block
      .row
        %h1.card-title {{ artwork.title }}
        %publisher.star{ "v-bind:artId": "artwork.id", "v-bind:published": "artwork.published", "v-on:publishingChanged": "updateArtwork()" }

      %ul.card-text
        %li Mediums: {{ artwork.mediums }}
        %li Year: {{ artwork.year }}

        %li.artist Artist: {{ artist.name }}
        %li Arts number: {{ artist['artworks-count'] }}
        %li Date of Birth: {{ artist['date-of-birth'] }}
        %li Biography: {{ artist.biography }}
      %router-link{ "v-bind:to": "'/'" } Home
</template>

<script lang="coffee">
  import Publisher  from './publisher.vue'

  export default {
    components:
      publisher: Publisher
    data: ->
      artwork: null
      artist: {}
    mounted: ()->
      this.fetchArtwork()
    methods:
      fetchArtwork: ->
        this.$http.get("/api/artworks/#{this.$route.params.id}?include=artist").then((art) =>
          this.$set(this, 'artwork', art.body?.data?.attributes)
          this.$set(this.artwork, 'id', art.body?.data?.id)
          this.$set(this, 'artist', art.body?.included?[0]?.attributes)
        , (response) ->
          console.log "Error on request: #{response}"
        )
      updateArtwork: ->
        this.artwork.published = !this.artwork.published
  }
</script>

<style scoped lang='scss'>
  @import 'bootstrap/dist/css/bootstrap.css';
  @import 'bootstrap-vue/dist/bootstrap-vue.css';

  .card.artwork {
    padding-top: 10px;
    margin: auto;
    ul {
      list-style: none;
      padding-left: 0;

      .artist {
        font-weight: bold;
        font-size: 18px;
        margin-top: 10px;
      }
    }
    .star {
      margin-left: auto;
      padding: 8px 0 5px 0;
    }
  }
</style>
