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
    props:
      totalPages:
        type: Number
        requried: true
    computed:
      currentPage: ->
        parseInt(@$route.params.page)
      firstPage: ->
        @currentPage < 2
      lastPage: ->
        @totalPages is @currentPage
      disablePrev: ->
        if @firstPage then 'disabled': true
      disableNext: ->
        if @lastPage then 'disabled': true
    methods:
      nextPage: ->
        unless @lastPage
          @$router.push("/page/#{@currentPage + 1}")
      prevPage: ->
        unless @firstPage
          @$router.push("/page/#{@currentPage - 1}")
  }
</script>

<style scoped lang='scss'>
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
