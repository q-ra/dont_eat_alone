'use strict'

new Vue({
  el: '.js-vue-bing-map',
  methods: {
    downloadMicrosoft: function(){
      $.getScript(
        'https://www.bing.com/api/maps/mapcontrol?branch=experimental&callback=bingMapsCallbackReference',
        function( data, textStatus, jqxhr ) {
        }
      )
    },

    initBingMap:  function(){
      this.microsoft = Microsoft
      this.bingMap = new this.microsoft.Maps.Map(
        document.getElementById('js-bing-map'),
        { credentials: 'AoJbSnOxLNIxMnVzS5cPoTSS_DyQ-svWe9E2x9-jMtZzdAQDl1psj8eUeoLGD9my' }
      )
      this.$on('bing-maps-rdy', function () {
        console.log('wwwwwwwwwwwwww')
      })
      this.$emit('bing-maps-rdy')
    },

    getLongituteAndLatitude: function(){

    },

    createHandler: function(){
      console.log('po emisji')
      this.microsoft.Maps.Events.addHandler(this.bingMap, 'click', (e) => {
        console.log('kliklem')
        var point = new this.microsoft.Maps.Point(e.getX(), e.getY());
        var loc = e.target.tryPixelToLocation(point);
        console.log(loc.longitude)
        console.log(loc.latitude)
      })
    }
  },

  // ...

  // function displayEventInfo(e) {
  //     if (e.targetType == "map") {
  //         var point = new Microsoft.Maps.Point(e.getX(), e.getY());
  //         var loc = e.target.tryPixelToLocation(point);
  //         document.getElementById("textBox").value = loc.latitude
  //             + ", " + loc.longitude;
  //     }

  mounted(){
    window.bingMapsCallbackReference = this.initBingMap
    this.downloadMicrosoft()
    // this.createHandler()
  },

  data: {
    bingMap: null,
    microsoft: null
  },

})
