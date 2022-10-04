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
                url: 'admins/categories'
                // url: 'admins/categories?page=2' for paginate
            }
            await axios(CategoriesQuery).then(res => {
                this.categories = res.data
                commit('setCategories', this.categories)
            }).catch(err => {
                console.log(err)
            })
        },
        async createNewCategory({commit}) {
            const DataQuery = {
                method: 'POST',
                url: 'admins/categories',
                params: {
                    // categories
                }
            }
            await axios(DataQuery).then(res => {
                // this.categories = res.data
                console.log("You are here!")
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
