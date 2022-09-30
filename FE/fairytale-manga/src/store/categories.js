import Vue from 'vue'
import Vuex from 'vuex'
import axios from '../plugins/axios'

Vue.use(Vuex)

export default {
    namespaced: true,
    state: {
        categories: [],
    },
    actions: {
        async getCategoryData({commit}) {
            const CategoriesQuery = {
                method: 'GET',
                url: 'http://localhost:3000/api/v1/admins/categories/'
            }
            await axios(CategoriesQuery).then(res => {
                this.categories = res.data
                commit('setCategories', this.categories)
            }).catch(err => {
                console.log(err)
            })
        },
    },
    getters: {}
    ,
    mutations: {
        setCategories(state, newCategories) {
            state.categories = newCategories.map(item => {
                return {
                    id: item.id,
                    name: item.name,
                    description: item.description
                }
            })
        }
    },
}
