import Vue from 'vue'
import Vuex from 'vuex'
import axios from '../plugins/axios'

Vue.use(Vuex)

export default {
    namespaced: true,
    state: {
        authors: [],
    },
    actions: {
        async getAuthorsData({commit}) {
            const DataQuery = {
                method: 'GET',
                url: 'admins/authors'
            }
            await axios(DataQuery).then(res => {
                this.authors = res.data
                commit('setAuthor', this.authors)
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
        }
    },
}
