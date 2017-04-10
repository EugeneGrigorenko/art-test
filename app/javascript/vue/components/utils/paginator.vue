<template lang='haml'>
  %nav.col-sm-6
    %ul.pagination
      %li.page-item{ "v-bind:class": "disablePrev" }
        %a.page-link.clickable{ "v-on:click": "prevPage" } Previous
      %li.page-item
        %a.page-link {{ currentPage }}
      %li.page-item{ "v-bind:class": "disableNext" }
        %a.page-link.clickable{ "v-on:click": "nextPage" } Next
</template>

<script lang="coffee">
  export default {
    data: ->
      currentPage: 1
      totalPages: 0
    props:
      url:
        type: String
        required: true
      eventName:
        type: String
        required: true
    computed:
      firstPage: ->
        this.currentPage < 2
      lastPage: ->
        this.totalPages is this.currentPage
      disablePrev: ->
        if this.firstPage then 'disabled': true
      disableNext: ->
        if this.lastPage then 'disabled': true
    mounted: ->
      this.fetchData()
    methods:
      fetchData: () ->
        this.$http.get(this.url, params: { page: this.currentPage }).then((arts) =>
          this.$set(this, 'totalPages', arts.body?.meta['page-count'])
          artworks = arts.body?.data?.map((art)=>
            art.attributes['id'] = art.id
            art.attributes
          )
          this.$emit(this.eventName, artworks)
        , (response) ->
          console.log "Error in request: #{response}"
        )
      nextPage: ->
        unless this.lastPage
          this.$set(this, 'currentPage', this.currentPage + 1)
          this.fetchData()
      prevPage: ->
        unless this.firstPage
          this.$set(this, 'currentPage', this.currentPage - 1)
          this.fetchData()
  }
</script>

<style scoped lang='scss'>
  @import 'bootstrap/dist/css/bootstrap.css';
  @import 'bootstrap-vue/dist/bootstrap-vue.css';

  nav, ul {
    margin: auto;
    ul {
      width: 173px;
    }
    .clickable {
      cursor: pointer;
    }
  }
</style>
