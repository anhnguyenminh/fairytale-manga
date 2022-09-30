import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

import categories from "@/store/categories";

export default new Vuex.Store({
  namespaced: true,
  state: {
    token:''
  },
  getters: {
  },
  mutations: {
    setToken(state, newToken){
      state.token = newToken
    },
    clearToken(state){
      state.token =''
    }
  },
  actions: {
  },
  modules: {
    categories
  }
})
