import Vue from 'vue'
import Vuex from 'vuex'
import axios from '../plugins/axios'

Vue.use(Vuex)

export default {
    namespaced: true,
    state: {
        stories: [],
    },
    actions: {
        async getStoriesData({commit}) {
            const DataQuery = {
                method: 'GET',
                url: 'admins/stories'
            }
            await axios(DataQuery).then(res => {
                this.stories = res.data
                console.log(this.stories)
                commit('setStories', this.stories)
            }).catch(err => {
                console.log(err)
            })
        }
    },
    getters: {}
    ,
    mutations: {
        setStories(state, newStories) {
            state.stories = newStories.map(item => {
                return {
                    id: item.id,
                    name: item.name,
                    description: item.description,
                    end: item.end
                }
            })
        }
    },
}
