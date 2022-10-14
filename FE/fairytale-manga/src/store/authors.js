import Vue from 'vue'
import Vuex from 'vuex'
import axios from '../plugins/axios'

Vue.use(Vuex)

export default {
    namespaced: true,
    state: {
        authors: [],
        options: []
    },
    actions: {
        // with old paginate
        async getAuthorsData({commit}) {
            const DataQuery = {
                method: 'GET',
                url: 'admins/authors?page=2'
            }
            await axios(DataQuery).then(res => {
                this.authors = res.data
                commit('setAuthor', this.authors)
            }).catch(err => {
                console.log(err)
            })
        },
        async getAllAuthors({commit}) {
            const DataQuery = {
                method: 'GET',
                url: 'admins/get_authors'
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
    mutations: {
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
        }
    },
}
