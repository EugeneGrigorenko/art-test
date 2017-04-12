<template lang="haml">
  .star{ "v-if": "artId", "v-bind:class": "starClass",  "v-on:click": "changeState" }
    %icon{ name: "star", scale: "2" }
</template>

<script lang="coffee">
  import 'vue-awesome/icons/star'
  import Icon from 'vue-awesome/components/Icon.vue'

  export default {
    computed:
      starClass: ->
        published: true if @published
    components:
      icon: Icon
    props:
      artId:
        type: String
      published:
        type: Boolean
    methods:
      changeState: ->
        @$http.patch("/api/artworks/#{@artId}", {
          data:
            type: 'artworks'
            id: @artId
            attributes:
              published: !@published
          }, {
          headers:
            'Content-Type': "application/vnd.api+json"
        }).then(=>
            @$emit('publishingChanged', @artId)
          , (response) ->
            console.log "Error on request: #{response}"
          )
  }
</script>

<style scoped lang='scss'>
  .published {
    color: #f2d707 !important;
  }
  .star {
    color: #898989;
    cursor: pointer;
  }
</style>
