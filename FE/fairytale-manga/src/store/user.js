import Vue from 'vue'
import Vuex from 'vuex'
import axios from '../plugins/user_axios'

Vue.use(Vuex)

export default {
    namespaced: true,
    state: {
        user: []
    },
    actions: {
        async getUserDetail({commit}) {
            const DataQuery = {
                method: 'GET',
                url: 'readers/show_current_readers/'
            }
            await axios(DataQuery).then(res => {
                console.log(res.data)
                commit('setUser', res.data)
            }).catch(err => {
                console.log(err)
            })
        }
    },
    getters: {}
    ,
    mutations: {
        setUser(state, payload) {
            console.log(payload)
            state.user = payload
        }
    }
}
