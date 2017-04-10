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
        if this.published
          published: true
        else
          unpublished: true
    components:
      icon: Icon
    props:
      artId:
        type: String
      published:
        type: Boolean
    methods:
      changeState: ->
        this.$http.patch("/api/artworks/#{this.artId}", {
          data:
            type: 'artworks'
            id: this.artId
            attributes:
              published: !this.published
          }, {
          headers:
            'Content-Type': "application/vnd.api+json"
        }).then(=>
            this.$emit('publishingChanged', this.artId)
          , (response)->
            console.log "Error on request: #{response}"
          )
  }
</script>

<style scoped lang='scss'>
  .published {
    color: #f2d707;
  }
  .unpublished {
    color: #898989;
  }
  .star {
    cursor: pointer;
  }
</style>
