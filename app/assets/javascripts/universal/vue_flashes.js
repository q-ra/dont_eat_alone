new Vue({
  el: '.js-vue-flash-messages',
  methods: {
    setFlashJson: function(jsonMessage){
      this.flashJson = jsonMessage
      if(Array.isArray(this.flashJson) && (this.flashJson.length)){
        if(this.flashJson[0].length == 2){
          Materialize.toast(this.flashJson[0][1], 4000)
        }
      }
    }
  },

  data: {
    flashJson: {}
  },

})
