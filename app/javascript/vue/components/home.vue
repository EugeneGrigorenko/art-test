<template lang='haml'>
  #app.container-fluid
    %ul.col-sm-6
      %artwork{ "v-for": "artwork in artworks", key: "artwork.id", "v-bind:artwork": "artwork", "v-on:publishingChanged": "toggleArtwork($event)" }
    %paginator{ "v-bind:total-pages": "totalPages" }
</template>

<script lang="coffee">
  import Artwork from './artworks/artwork.vue'
  import Paginator from './utils/paginator.vue'

  export default {
    components:
      artwork: Artwork
      paginator: Paginator
    data: ->
      artworks: [],
      totalPages: 0
    methods:
      fetchArtworks: ->
        @$http.get('/api/artworks/', params: { page: @$route.params.page }).then((arts) =>
          @totalPages = arts.body?.meta?.pageCount
          artworks = arts.body?.data?.map((art) =>
            art.attributes['id'] = art.id
            art.attributes
          )
          @artworks = artworks
        , (response) ->
          console.log "Error in request: #{response}"
        )
      toggleArtwork: (artworkId)->
        artwork = (art for art in this.artworks when art.id is artworkId)[0]
        artwork.published = !artwork.published
    watch:
      '$route': 'fetchArtworks'
    mounted: ->
      @fetchArtworks()
  }
</script>

<style scoped lang='scss'>
  ul {
    padding-top: 10px;
    margin: auto;
  }
</style>
