import Vue from 'vue'
import Vuex from 'vuex'
import axios from '../plugins/axios'

Vue.use(Vuex)

export default {
    namespaced: true,
    state: {
        readers: [],
        meta: {},
        currentPage: 1
    },
    actions: {
        async getReadersData({state,commit}) {
            const DataQuery = {
                method: 'GET',
                url: `admins/readers?page=${state.currentPage}`
            }
            await axios(DataQuery).then(res => {
                commit('setReader', res.data.readers)
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
        setReader(state, newReader) {
            state.readers = newReader.map(item => {
                return {
                    id: item.id,
                    email: item.email,
                    name: item.name,
                    age: item.age,
                    address: item.address,
                    phonenumber: item.phonenumber,
                    ban: item.ban,
                    score: item.score,
                    show_gender: item.show_gender
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
