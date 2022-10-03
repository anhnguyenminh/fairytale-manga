import Vue from 'vue'
import Vuex from 'vuex'
import axios from '../plugins/axios'

Vue.use(Vuex)

export default {
    namespaced: true,
    state: {
        gifts: [],
    },
    actions: {
        async getGift({commit}) {
            const DataQuery = {
                method: 'GET',
                url: 'admins/gifts'
            }
            await axios(DataQuery).then(res => {
                this.gifts = res.data
                commit('setGift', this.gifts)
            }).catch(err => {
                console.log(err)
            })
        },
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
                    stock: item.stock
                }
            })
        }
    },
}
