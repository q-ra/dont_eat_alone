Vue.component('vue-loading-circle-componet', {
  template:   ` <div class='dea-flex-centered dea-width-height-100-percent'>
                  <div :class="['preloader-wrapper','big', loading]" >
                    <div class="spinner-layer spinner-red-only">
                      <div class="circle-clipper left">
                        <div class="circle"></div>
                      </div>
                      <div class="gap-patch">
                        <div class="circle"></div>
                      </div>
                      <div class="circle-clipper right">
                        <div class="circle"></div>
                      </div>
                    </div>
                  </div>
                </div>`,
  props: ['loading'],
})


// new Vue({
//   el: '#example'
// })
