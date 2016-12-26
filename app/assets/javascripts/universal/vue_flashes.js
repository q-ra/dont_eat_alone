new Vue({
  el: '.js-vue-flash-messages',
  methods: {
    setFlashJson: function(jsonMessage){
      this.flashJson = jsonMessage
      if(Array.isArray(this.flashJson) && (this.flashJson.length)){
        if(this.flashJson[0].length == 2){
          let tmpType = this.flashJson[0][0]
          let _title = this.flashJson[0][1]

          if(tmpType == 'alert'){
            _type = 'warning'
          } else if (tmpType == 'notice'){
            _type = 'success'
          } else {
            _type == 'error'
          }
          swal({
            title: _title,
            type: _type
          })
        }
      }
    }
  },

  data: {
    flashJson: {}
  },

})
