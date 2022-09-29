import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

export default {
    namespaced: true,
    state: {
        // categories: [
        //     {
        //         id: '',
        //         name: '',
        //         description: ''
        //     }
        // ]
        categories: []
    },
    actions: {
        async getCategoryData({commit}) {
            const CategoriesQuery = {
                method: 'GET',
                url: 'http://localhost:3000/api/v1/admins/categories/'
            }
            await axios(CategoriesQuery).then(res => {
                this.categories = res.data
                console.log(this.categories)
                commit('setCategories', this.categories)
            }).catch(err => {
                console.log(err)
            })
        }
    },
    getters: {},
    mutations: {
        setCategories(state, newCategories) {
            state.categories = newCategories.map(item => {
                return {
                    id: item.id,
                    name: item.name,
                    description: item.description
                }
            })

        },
    },
}
