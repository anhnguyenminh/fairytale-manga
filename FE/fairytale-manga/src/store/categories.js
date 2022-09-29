import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

export default {
    namespaced: true,
    state: {
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
        },
        // addNewCategory({commit}) {
        //     let self = this;
        //     axios.post('http://localhost:3000/api/v1/admins/categories/', {
        //         name: "This is test name",
        //         description: "This is test description"
        //     }).then(function (response) {
        //         console.log(response);
        //         alert("Add new success!!!")
        //         self.$router.push({path: "/admin/categories"}) //need change router-link to dashboard
        //         console.log("Da chay vao den day roi hihi");
        //
        //     }).catch(function (error) {
        //         console.log(error);
        //         alert("Co gi do sai sai, kiem tra lai di, baka !!!");
        //     });
        // }
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
        ,
    }
    ,
}
