import Vue from 'vue'
import Vuex from 'vuex'
import axios from '../plugins/axios'

Vue.use(Vuex)

export default {
    namespaced: true,
    state: {
        readers: [],
    },
    actions: {
        async getReadersData({commit}) {
            const DataQuery = {
                method: 'GET',
                url: 'admins/readers'
            }
            await axios(DataQuery).then(res => {
                this.readers = res.data
                commit('setReader', this.readers)
            }).catch(err => {
                console.log(err)
            })
        },
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
                    gender: item.gender,
                    phonenumber: item.phonenumber,
                    address: item.address,
                    score: item.score
                }
            })
        }
    },
}
