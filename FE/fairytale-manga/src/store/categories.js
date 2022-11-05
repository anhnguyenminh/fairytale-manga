import Vue from 'vue'
import Vuex from 'vuex'
import axios from '../plugins/axios'

Vue.use(Vuex)

export default {
    namespaced: true,
    state: {
        categories: [],
        option2: [],
        meta: {},
        currentPage: 1
    },
    actions: {
        async getCategoryData({state, commit}) {
            const CategoriesQuery = {
                method: 'GET',
                url: `admins/categories?page=${state.currentPage}`

            }
            await axios(CategoriesQuery).then(res => {
                this.categories = res.data.categories
                // console.log(res.data)
                commit('setCategories', this.categories)
                commit('setMeta', res.data.meta);
            }).catch(err => {
                console.log(err)
            })
        },
        setCurrentPage({commit}, payload) {
            commit("setCurrentPage", payload)
        },
        //get all data
        async getAllCategories({commit}) {
            const DataQuery = {
                method: 'GET',
                url: 'admins/stories/get_categories'
            }
            await axios(DataQuery).then(res => {
                this.categories = res.data
                commit('setCategoriesOptions', this.categories)
            }).catch(err => {
                console.log(err)
            })
        }
    }
    ,
    getters: {}
    ,
    mutations:{
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
        },
        setMeta(state, payload) {
            state.meta = payload;
        },
        setCurrentPage(state, payload) {
            state.currentPage = payload;
        }
    }
}