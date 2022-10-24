import Vue from 'vue'
import Vuex from 'vuex'
import axios from '../plugins/axios'

Vue.use(Vuex)

export default {
    namespaced: true,
    state: {
        authors: [],
        options: [],
        meta: {},
        currentPage: 1
    },
    actions: {
        // with old paginate
        async getAuthorsData({state, commit}) {
            const DataQuery = {
                method: 'GET',
                url: `admins/authors?page=${state.currentPage}`
            }
            await axios(DataQuery).then(res => {
                commit('setAuthor', res.data.authors);
                commit('setMeta', res.data.meta);
            }).catch(err => {
                console.log(err)
            })
        },
        setCurrentPage({commit}, payload) {
            commit("setCurrentPage", payload)
        },
        async getAllAuthors({commit}) {
            const DataQuery = {
                method: 'GET',
                url: 'admins/stories/get_authors'
            }
            await axios(DataQuery).then(res => {
                this.authors = res.data
                commit('setAuthorsOptions', this.authors)
            }).catch(err => {
                console.log(err)
            })
        },
    },
    getters: {}
    ,
    mutations:{
        setAuthor(state, newAuthor) {
            state.authors = newAuthor.map(item => {
                return {
                    id: item.id,
                    name: item.name,
                    description: item.description
                }
            })
        },
        setAuthorsOptions(state, newOption) {
            state.options = newOption.map(item => {
                return {
                    value: item.id,
                    text: item.name
                }
            })
        },
        setMeta(state, payload) {
            state.meta = payload;
        },
        setCurrentPage(state, payload) {
            state.currentPage = payload;
        }
    }
}
