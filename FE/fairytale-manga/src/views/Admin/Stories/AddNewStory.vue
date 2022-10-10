<template>
  <div class="container">
    <div class="d-flex align-items-center ">
      <router-link :to="{path: '/admin/stories/'}" class="btn" style="background-color: #f1f1f1" tag="button">
        <b-icon variant="dark" icon="arrow-left"></b-icon>
      </router-link>
      <h2 style="margin: 0 1.2rem ;">Add New Story</h2>
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
            <b-form-group label="Category">
              <b-form-select v-model="form.selected" :options="form.options"></b-form-select>
            </b-form-group>

            <b-form-group id="input-group-2" label="Description" label-for="textarea">
              <b-form-textarea
                  id="textarea"
                  v-model="form.description"
                  placeholder="Enter description for this story"
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
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                  <tr>
                    <th class="col-3">ID</th>
                    <th class="col-5">Chapter</th>
                    <th class="col-4 col-last">Actions</th>
                  </tr>
                  </thead>
                  <tbody>
<!--                  <tr>-->
<!--                    <td class="col-3">1</td>-->
<!--                    <td class="col-5">Chapter 1</td>-->
<!--                    <td class="col-4 actions">-->
<!--                      <a>-->
<!--                        <button class="btn btn-info">Edit</button>-->
<!--                      </a>-->
<!--                      <a href="#">-->
<!--                        <button class="btn btn-danger" >Delete</button>-->
<!--                      </a>-->
<!--                    </td>-->
<!--                  </tr>-->

                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        <div class="content">

          <div style="display: flex;justify-content: center;align-items: center;">
            <b-button class="my-btn" type="submit" variant="success">Save story</b-button>
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
              <a href="#">Add</a>
            </div>
          </div>
          <div style="height: 50%; width: 200px; margin: auto;">
            <img src="https://st.ntcdntempv3.com/data/comics/172/saotome-san-va-tro-choi-sinh-tu.jpg" alt="" style="height: 100%; width: 100%">
          </div>
        </div>

      </div>
    </div>

  </div>
</template>

<script>
export default {
  name: 'UpdateStory',
  data() {
    return {
      form: {
        name: '',
        description: '',
        selected: null,
        options: [
          {value: null, text: 'Please select an option'},
          {value: 'a', text: 'This is First option'},
          {value: 'b', text: 'Selected Option'},
          {value: {C: '3PO'}, text: 'This is an option with object value'},
          {value: 'd', text: 'This one is disabled', disabled: true}
        ]
      }
    }
  },
  methods: {}
}
</script>

<style scoped>
.wrap-body {
  align-items: flex-start;
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  margin-left: calc(1.25rem * -1);
  margin-top: calc(1rem * -1);
}

.left-side {
  margin-left: 1.25rem;
  margin-top: 1rem;
  /*max-width: calc(100% - 1.25rem);*/

  /*flex: 2 2 30rem;*/
  min-width: 66%;
}

.content {
  background-color: #f1f1f1;
  border-radius: 0.5rem;

  margin: 1.5rem 0;
  padding: 1.25rem 1rem;
}

/* right-side */
.right-side {
  margin-left: 1.25rem;
  margin-top: 1rem;
  min-width: 30%;
}


/* table */
.col-last {
  text-align: right;
  padding-right: 17px;
}

.actions {
  text-align: right;
}
.actions button {
  margin: 0 5px;
}

/* button save or delete */


</style>