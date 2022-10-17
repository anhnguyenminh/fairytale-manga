import Vue from 'vue'
import Vuex from 'vuex'
import axios from '../plugins/axios'

Vue.use(Vuex)

export default {
    namespaced: true,
    state: {
        admins: []
    },
    actions: {
        async getAdminData({commit}) {
            const DataQuery = {
                method: 'GET',
                url: 'admins/admins'
            }
            await axios(DataQuery).then(res => {
                this.admins = res.data
                commit('setAdmin', this.admins)
            }).catch(err => {
                console.log(err)
            })
        }
    },
    getters: {}
    ,
    mutations: {
        setAdmin(state, newAdmin) {
            state.categories = newAdmin.map(item => {
                return {
                    id: item.id,
                    email: item.email,
                    username: item.username
                }
            })
        }
    }
}
