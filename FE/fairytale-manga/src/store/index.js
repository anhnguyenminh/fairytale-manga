import Vue from 'vue'
import Vuex from 'vuex'
import createPersistedState from "vuex-persistedstate";

Vue.use(Vuex)

import categories from "@/store/categories";

const dataState = createPersistedState({
  paths: ['token']
})

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
  },plugins: [dataState]
})
