<template>
  <div class="container">
    <div class="d-flex align-items-center ">
      <router-link :to="{path: '/admin/stories/'}" class="btn go-back" tag="button">
        <b-icon variant="dark" icon="arrow-left"></b-icon>
      </router-link>
      <h2 class="page-header">Trò chơi sinh tử</h2>
    </div>
    <div class="wrap-body">
      <!--      left-->
      <div class="left-side">
        <div class="content">

          <b-form>
            <b-form-group id="input-group-1" label="Title" label-for="input-1">
              <b-form-input
                  id="input-1"
                  v-model="form.name"
                  type="text"
                  placeholder="Enter story name..."
                  required
              ></b-form-input>
            </b-form-group>

            <b-form-group label="Author">
              <b-form-select v-model="form.selected" :options="form.options"></b-form-select>
            </b-form-group>

            <b-form-group label="Category" v-slot="{ ariaDescribedby }">
              <b-form-checkbox-group
                  id="checkbox-group-category"
                  v-model="form.selected2"
                  :options="form.options2"
                  :aria-describedby="ariaDescribedby"
                  stacked
                  name="categories"
              ></b-form-checkbox-group>
            </b-form-group>
            <b-form-group label="Description" label-for="textarea">
              <b-form-textarea
                  id="textarea"
                  v-model="form.description"
                  placeholder="Enter short summary for this story"
                  rows="3"
                  max-rows="6"
                  required
              ></b-form-textarea>
            </b-form-group>
          </b-form>

        </div>
        <div class="content">
          <div class="d-flex justify-content-between align-items-center">
            <h5>Chapters</h5>
            <div>
              <router-link class="btn btn-success" :to="{ path: '/admin/stories/ten-truyen/new-chapter' }" role="button">+ New chapter
              </router-link>
            </div>
          </div>
          <div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" width="100%" cellspacing="0">
                  <thead>
                  <tr>
                    <th class="col-3">ID</th>
                    <th class="col-5">Chapter</th>
                    <th class="col-4 col-last">Actions</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                    <td class="col-3">1</td>
                    <td class="col-5">Chapter 1</td>
                    <td class="col-4 actions">
                      <a>
                        <button class="btn btn-info">Edit</button>
                      </a>
                      <a>
                        <button class="btn btn-danger" >Delete</button>
                      </a>
                    </td>
                  </tr>
                  <tr>
                    <td class="col-3">2</td>
                    <td class="col-5">Chapter 2</td>
                    <td class="col-4 actions">
                      <a>
                        <button class="btn btn-info">Edit</button>
                      </a>
                      <a>
                        <button class="btn btn-danger" >Delete</button>
                      </a>
                    </td>
                  </tr>
                  <tr>
                    <td class="col-3">3</td>
                    <td class="col-5">Chapter 3</td>
                    <td class="col-4 actions">
                      <a>
                        <button class="btn btn-info">Edit</button>
                      </a>
                      <a>
                        <button class="btn btn-danger" >Delete</button>
                      </a>
                    </td>
                  </tr>
                  <tr>
                    <td class="col-3">4</td>
                    <td class="col-5">Chapter 4</td>
                    <td class="col-4 actions">
                      <a>
                        <button class="btn btn-info">Edit</button>
                      </a>
                      <a>
                        <button class="btn btn-danger" >Delete</button>
                      </a>
                    </td>
                  </tr>
                  <tr>
                    <td class="col-3">5</td>
                    <td class="col-5">Chapter 5</td>
                    <td class="col-4 actions">
                      <a>
                        <button class="btn btn-info">Edit</button>
                      </a>
                      <a>
                        <button class="btn btn-danger" >Delete</button>
                      </a>
                    </td>
                  </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        <div class="content">

          <div class="btn-bottom">
            <b-button class="my-btn" type="reset" variant="outline-danger">Delete this story</b-button>
            <b-button class="my-btn-submit" type="submit" variant="outline-success">Save story</b-button>
          </div>
        </div>
      </div>
      <!--      right-->
      <div class="right-side">
        <div class="content">

          <b-form>
            <b-form-group label="Status">
              <b-form-select v-model="form.selected" :options="form.options"></b-form-select>
            </b-form-group>

          </b-form>

        </div>
        <div class="content">
          <div class="d-flex justify-content-between align-items-center">
            <h6>Cover image</h6>
            <div>
              <a href="#">Edit</a>
            </div>
          </div>
          <div class="wrapped-image img">
            <img src="https://st.ntcdntempv3.com/data/comics/172/saotome-san-va-tro-choi-sinh-tu.jpg" alt="cover-picture">
          </div>
        </div>

      </div>
    </div>

  </div>
</template>

<script>
require('@/assets/css/story.css')

export default {
  name: 'UpdateStory',
  data() {
    return {
      form: {
        name: '',
        // description: '',
        selected: null,
        options: [
          {value: null, text: 'Please select an option'},
          {value: 'a', text: 'This is First option'},
          {value: 'b', text: 'Selected Option'},
          {value: {C: '3PO'}, text: 'This is an option with object value'},
          {value: 'd', text: 'This one is disabled', disabled: true}
        ],
        selected2: [], // Must be an array reference!
        options2: [
          { text: 'Comedy', value: 'comedy' },
          { text: 'One shot', value: 'oneshot' },
          { text: 'Historical', value: 'historical' },
          { text: 'Mystery', value: 'mystery' },
          { text: 'Adventure', value: 'adventure' },
          { text: 'Horror', value: 'horror' },
          { text: 'Harem', value: 'harem' },
          { text: 'Supernatural', value: 'supernatural' }
        ]
      }
    }
  },
  methods: {}
}
</script>

<style scoped>

</style>