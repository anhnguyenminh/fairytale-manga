import Vue from 'vue'
import Vuex from 'vuex'
import axios from '../plugins/axios'

Vue.use(Vuex)

export default {
    namespaced: true,
    state: {
        categories: [],
        option2:[]
    },
    actions: {
        // with old paginate
        async getCategoryData({commit}) {
            const CategoriesQuery = {
                method: 'GET',
                url: 'admins/categories'

            }
            await axios(CategoriesQuery).then(res => {
                this.categories = res.data
                commit('setCategories', this.categories)
            }).catch(err => {
                console.log(err)
            })
        },
        //get all data
        async getAllCategories({commit}) {
            const DataQuery = {
                method: 'GET',
                url: 'admins/get_categories'

            }
            await axios(DataQuery).then(res => {
                this.categories = res.data
                commit('setCategoriesOptions', this.categories)
            }).catch(err => {
                console.log(err)
            })
        }
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
        },
        setCategoriesOptions(state, newOption) {
            state.option2 = newOption.map(item => {
                return {
                    value: item.id,
                    text: item.name
                }
            })
        }
    },
}
