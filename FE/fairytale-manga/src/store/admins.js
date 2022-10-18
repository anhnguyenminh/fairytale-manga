import Vue from 'vue'
import Vuex from 'vuex'
import axios from '../plugins/axios'

Vue.use(Vuex)

export default {
    namespaced: true,
    state: {
        admin: []
    },
    actions: {
        async getAdminDetail({commit}) {
            const DataQuery = {
                method: 'GET',
                url: 'admins/admins/show_current_admin/'
            }
            await axios(DataQuery).then(res => {
                // this.admin = res.data
                // console.log(this.admin)
                commit('setAdmin', res.data)
            }).catch(err => {
                console.log(err)
            })
        }
    },
    getters: {}
    ,
    mutations: {
        setAdmin(state, newAdmin) {
            // console.log(newAdmin)
            state.admin = newAdmin
        }
    }
}
