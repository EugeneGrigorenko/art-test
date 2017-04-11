<template lang='haml'>
  .card.artwork.col-sm-6{ "v-if": "artwork" }
    %img.img{ "v-bind:src": "artwork.largeImageUrl" }
    .card-block
      .row
        %h1.card-title {{ artwork.title }}
        %publisher.star{ "v-bind:artId": "artwork.id", "v-bind:published": "artwork.published", "v-on:publishingChanged": "toggleArtwork()" }

      %ul.card-text
        %li Mediums: {{ artwork.mediums }}
        %li Year: {{ artwork.year }}

        %li.artist Artist: {{ artist.name }}
        %li Arts number: {{ artist.artworksCount }}
        %li Date of Birth: {{ artist.dateOfBirth }}
        %li Biography: {{ artist.biography }}
      %a{ href: "#", "v-on:click": "back" } Back
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
      @fetchArtwork()
    methods:
      back: ->
        @$router.go(-1)
      fetchArtwork: ->
        @$http.get("/api/artworks/#{@$route.params.id}?include=artist").then((art) =>
          @artwork = art.body?.data?.attributes
          @artwork.id = art.body?.data?.id
          @artist = art.body?.included?[0]?.attributes
        , (response) ->
          console.log "Error on request: #{response}"
        )
      toggleArtwork: ->
        @artwork.published = !@artwork.published
  }
</script>

<style scoped lang='scss'>
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
