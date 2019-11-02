<template>
  <div id="app">
<splitpanes v-press="onPress" id="adjustfit" class="default-theme" horizontal :push-other-panes="false" @resize="verticalTopSize = $event[0];resizeTOPHIGH();" style="height: 100vh; width: 100vw; margin-top: -60px; display: flex;">
  <pane ref="vertical_top">
  <splitpanes :push-other-panes="false">
     <pane ref='top_left' > 
    <span style="display: flex; color: white; font-size: 6vw;">T.Left <span style="font-size: 4vw;">{{ topLeftpane}}%</span>{{Math.round(firstRow)}}</span>
  </pane>
  <pane>
    <span style="display: flex; color: white; font-size: 6vw;">Header <span style="font-size: 4vw;">{{ topMiddlepane}}%</span></span>
  </pane>
   <pane ref='top_right' >
    <span style="display: flex; color: white; font-size: 6vw;">T.Right <span style="font-size: 4vw;">{{ topRightpane}}%</span></span>
  </pane>
  </splitpanes>
  </pane>
  <pane ref="vertical_middle">
    <splitpanes @resize="middlePaneWideSize = $event[0]; resizeMIDDLEWIDE();" :push-other-panes="false">
      <pane ref="middle_left">
           <span style="display: flex; color: white; font-size: 6vw;">Left <span style="font-size: 4vw;">{{ middleLeftpane}}%{{Math.round(secondRow)}}</span></span>
      </pane>
      <pane>
          <span style="display: flex; color: white; font-size: 6vw;">middle <span style="font-size: 4vw;">{{middleMiddlepane}}%</span></span>
      </pane>
      <pane ref="middle_right">
       <span style="display: flex; color: white; font-size: 6vw;">Right <span style="font-size: 4vw;">{{ middleRightpane}}%</span></span>
      </pane>
    </splitpanes>
  </pane>
   <pane ref="vertical_bottom">
  <splitpanes @resize="bottomPaneWideSize = $event[0]; resizeBOTTOMWIDE();" :push-other-panes="false">
  <pane ref='bottom_left'>
    <span style="display: flex; color: white; font-size: 6vw;"> B.Left <span style="font-size: 4vw;">{{ bottomLeftpane}}%{{Math.round(thirdRow)}}</span></span>
  </pane>
  <pane ref='bottom_middle'>
    <span style="display: flex; color: white; font-size: 6vw;"> Footer <span style="font-size: 4vw;">{{ bottomMiddlepane}}%</span></span>
  </pane>
   <pane ref="bottom_right">
    <span style="display: flex; color: white; font-size: 6vw;"> B.Right <span style="font-size: 4vw;">{{ bottomRightpane}}%</span></span>
  </pane>
  </splitpanes>
  </pane>
</splitpanes>

<div v-if="showFeatureAdd" style="height: 30vh; width: 80vw; background-color: red; position: relative; z-index: 3; top: -100vh; left: 10vw; right: 10vw; border: 1px solid orange;"> 
    <input type="text" autofocus style="width: 100%;" placeholder="Search for elements to add"/>
    <ul class='searchBox' style="list-style: none;">
      <li>Picture</li>
       <li>Video</li>
        <li>Blank space</li>
         <li>Text</li>
    </ul>
    <button @click="showFeatureAdd = false" style="width: 100%; color: white; background-color: red;  position: absolute; bottom: 0;">CLOSE</button>
  </div>

  </div>
</template>

<script>
import Vue from 'vue/dist/vue.js';

import { Splitpanes, Pane } from 'splitpanes'


Vue.component('splitpanes', Splitpanes); 
Vue.component('pane', Pane)

export default {
  data: function () {
    return {
      showFeatureAdd: false,
      paneWidth: 33.33,
       panesNumber: 5,
      topPaneWidthSize: 100, 
      verticalTopSize: 100,
      middlePaneWideSize: 100,
        firstRow: 0, 
        secondRow: 0, 
        thirdRow: 0,
        topLeftpane: 0, 
        topMiddlepane: 0,
        topRightpane: 0,
        middleLeftpane: 0,
        middleMiddlepane: 0,
        middleRightpane: 0,
        bottomLeftpane: 0,
        bottomMiddlepane: 0,
        bottomRightpane: 0,
      slideOutput: '', 
      tapOutput: '',
      pressOutput: '',
     cellSize: {
                    w: 100,
                    h: 100
                },
                maxColumnCount: 12,
                maxRowCount: 12,
                bubbleUp: false,
                margin: 5,
                boxCount: 4,
                autoAddLayoutForNewBox: false,
                layout: [
                    {
                        id: 'settings',
                        hidden: false,
                        pinned: true,
                        position: {
                            x: 0,
                            y: 0,
                            w: 12,
                            h: 1
                        }
                    },
                    {
                        id: 1,
                        hidden: false,
                        pinned: false,
                        position: {
                            x: 4,
                            y: 0,
                            w: 2,
                            h: 1
                        }
                    },
                    {
                        id: 2,
                        hidden: false,
                        pinned: false,
                        position: {
                            x: 6,
                            y: 0,
                            w: 1,
                            h: 2
                        }
                    },
                    {
                        id: 3,
                        hidden: false,
                        pinned: false,
                        position: {
                            x: 4,
                            y: 1,
                            w: 2,
                            h: 3
                        }
                    },
                    {
                        id: 4,
                        hidden: false,
                        pinned: false,
                        position: {
                            x: 6,
                            y: 2,
                            w: 3,
                            h: 2
                        }
                    }
                ],
    }
  },

    computed: {
            layoutWithoutSettings () {
                return this.layout.filter((box) => {
                    return box.id !== 'settings'
                })
            },
            
        },
  methods: {
    resizeTOPHIGH(){
      this.firstRow = parseInt(this.$refs.vertical_top.style.height)
      this.secondRow = parseInt(this.$refs.vertical_middle.style.height)
      this.thirdRow = parseInt(this.$refs.vertical_bottom.style.height)
    
    },
  
   
      resizeTOPWIDE(){
       this.topLeftpane = parseInt(this.$refs.top_left.style.width)
       this.topMiddlepane = 100 - (parseInt(this.$refs.top_left.style.width) + parseInt(this.$refs.top_right.style.width))
       this.topRightpane = parseInt(this.$refs.top_right.style.width)
      },
       resizeMIDDLEWIDE(){
       this.middleLeftpane = parseInt(this.$refs.middle_left.style.width)
       this.middleMiddlepane = 100 - (parseInt(this.$refs.middle_left.style.width) + parseInt(this.$refs.middle_right.style.width))
       this.middleRightpane = parseInt(this.$refs.middle_right.style.width)
      },
        resizeBOTTOMWIDE(){
       this.bottomLeftpane = parseInt(this.$refs.bottom_left.style.width)
       this.bottomMiddlepane = 100 - (parseInt(this.$refs.bottom_left.style.width) + parseInt(this.$refs.bottom_right.style.width))
       this.bottomRightpane = parseInt(this.$refs.bottom_right.style.width)
      },
       onPan(event) {
          this.slideOutput = event;
      const deltaX = event.deltaX; // moved distance on x-axis
      const deltaY = event.deltaY; // moved distance on y-axis
      const isFinal = event.isFinal; // pan released
      const direction = event.direction; // 0 = none, 2 = left, 4 = right, 8 = up, 16 = down,
    },
      onTap(event){  
        event.preventDefault()
   
      },
      onPress(event){
        // this.pressOutput = event
       
         event.preventDefault()
         console.log(event)
        if(event.target.className == 'splitpanes__pane'){
           this.showFeatureAdd = true
         event.target.innerHTML = '<img src="https://bit.ly/34ebo0M" height= "100%" width="100%"></img>'
      // do something cool
     
          // var testbro = '<splitpanes :push-other-panes="false"><pane><span style="display: flex; color: white; font-size: 3em;">Left</span></pane><pane><span style="display: flex; color: white; font-size: 3em;">Center</span></pane><pane><span style="display: flex; color: white; font-size: 3em;">Right</span></pane></splitpanes>'
          // var testboi = '<splitpanes :push-other-panes="false"><pane><span style="display: flex; color: white; font-size: 3em;">Left</span></pane><pane><span style="display: flex; color: white; font-size: 3em;">Center</span></pane><pane><span style="display: flex; color: white; font-size: 3em;">Right</span></pane></splitpanes>'
          //   event.target.insertAdjacentElement("afterbegin", `
        }
    
      },
        onLayoutUpdate:  function(evt) {
                this.layout = evt.layout
        },
    onResize: function (x, y, width, height) {

      this.x = x
      this.y = y
      this.width = width
      this.height = height
    },
    onDrag: function (x, y) {
      this.x = x
      this.y = y
    }
  },
watch: {    
     layout: function(newvalue, oldvalue){
       console.log(newvalue)
    }
  },
  components: {
        Splitpanes,
        Pane

  }
}

</script>

<style scoped>

.searchBox {
  background-color: #f2f2f2;
  justify-content: center;
}
.searchBox:nth-child(2) {
  background-color: #bbb;
}



</style>
