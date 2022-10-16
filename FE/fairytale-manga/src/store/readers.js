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
                console.log("Get here")
                this.readers = res.data.readers
                // console.log(this.readers)
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
                    address: item.address,
                    phonenumber: item.phonenumber,
                    ban: item.ban,
                    score: item.score,
                    show_gender: item.show_gender
                }
            })
        }
    },
}
