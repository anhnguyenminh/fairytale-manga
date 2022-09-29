import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

import categories from "@/store/categories";

export default new Vuex.Store({
  namespaced: true,
  state: {
    categories,
    token:''
  },
  getters: {
  },
  mutations: {
  },
  actions: {
  },
  modules: {
    categories
  }
})
