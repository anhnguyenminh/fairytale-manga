import Vue from 'vue'
import Vuex from 'vuex'
import createPersistedState from "vuex-persistedstate";

Vue.use(Vuex)

import categories from "@/store/categories";
import gifts from "@/store/gifts";
import authors from "@/store/authors";
import readers from "@/store/readers";
import stories from "@/store/stories"
import admins from "@/store/admins";
import chapters from "@/store/chapters";
const dataState = createPersistedState({
    paths: ['token']
})

export default new Vuex.Store({
    namespaced: true,
    state: {
        token: ''
    },
    getters: {},
    mutations: {
        setToken(state, newToken) {
            state.token = newToken
        },
        clearToken(state) {
            state.token = ''
        }
    },
    actions: {},
    modules: {
        categories, authors, gifts, readers, stories, admins, chapters
    }, plugins: [dataState]
})
