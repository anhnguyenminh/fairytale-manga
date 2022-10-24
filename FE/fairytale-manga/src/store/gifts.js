import Vue from 'vue'
import Vuex from 'vuex'
import axios from '../plugins/axios'

Vue.use(Vuex)

export default {
    namespaced: true,
    state: {
        gifts: [],
        meta: {},
        currentPage: 1
    },
    actions: {
        async getGift({state, commit}) {
            const DataQuery = {
                method: 'GET',
                url: `admins/gifts?page=${state.currentPage}`
            }
            await axios(DataQuery).then(res => {
                commit('setGift', res.data.gifts)
                commit('setMeta', res.data.meta);
            }).catch(err => {
                console.log(err)
            })
        },
        setCurrentPage({commit}, payload) {
            commit("setCurrentPage", payload)
        }
    },
    getters: {}
    ,
    mutations: {
        setGift(state, newGift) {
            state.gifts = newGift.map(item => {
                return {
                    id: item.id,
                    name: item.name,
                    score: item.score,
                    stock: item.stock,
                    image_url: item.image_url
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
