import Vue from 'vue'
import Vuex from 'vuex'
import axios from '../plugins/axios'

Vue.use(Vuex)

export default {
    namespaced: true,
    state: {
        chapters: [],
    },
    actions: {
        async getChaptersData({commit}) {
            const DataQuery = {
                method: 'GET',
                url: 'admins/chapters'
            }
            await axios(DataQuery).then(res => {
                this.chapters = res.data.chapters
                commit('setChapters', this.chapters)
            }).catch(err => {
                console.log(err)
            })
        }
    },
    getters: {}
    ,
    mutations: {
        setChapters(state, newChapter) {
            state.stories = newChapter.map(item => {
                return {
                    id: item.id,
                    name: item.name,
                    images_url: item.images_url
                }
            })
        }
    },
}
