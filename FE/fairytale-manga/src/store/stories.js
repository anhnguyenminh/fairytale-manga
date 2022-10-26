import Vue from 'vue'
import Vuex from 'vuex'
import axios from '../plugins/axios'

Vue.use(Vuex)

export default {
    namespaced: true,
    state: {
        stories: [],
        meta: {},
        currentPage: 1
    },
    actions: {
        async getStoriesData({state, commit}) {
            const DataQuery = {
                method: 'GET',
                url: `admins/stories?page=${state.currentPage}`
            }
            await axios(DataQuery).then(res => {
                console.log(res.data)
                commit('setStories', res.data.stories)
                commit('setMeta', res.data.meta);
            }).catch(err => {
                console.log(err)
                // alert("Your authenticate is expired, please login again.!")
                // goSomeWhere
            })
        },
        setCurrentPage({commit}, payload) {
            commit("setCurrentPage", payload)
        }
    },
    getters: {},
    mutations: {
        setStories(state, newStories) {
            state.stories = newStories.map(item => {
                return {
                    id: item.id,
                    name: item.name,
                    description: item.description,
                    status: item.status,
                    author_name: item.author_name,
                    category: item.category
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
