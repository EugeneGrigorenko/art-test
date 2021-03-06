
import Vue from 'vue/dist/vue.esm';
import VueRouter from 'vue-router';
import VueResource from 'vue-resource';
import BootstrapVue from 'bootstrap-vue';

import Home  from '../vue/components/home.vue';
import ArtworkDetailed  from '../vue/components/artworks/artwork-detailed.vue';

Vue.use(BootstrapVue);
Vue.use(VueRouter);
Vue.use(VueResource);

const routes = [
  { path: '/artworks/:id', component: ArtworkDetailed },
  { path: '/page/:page', component: Home },
  { path: '/', redirect: '/page/1' }
]

const router = new VueRouter({
  routes: routes
})

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#main-container',
    router
  })
})
