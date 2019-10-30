<template>
  <div id="app">
 <!-- <dnd-grid-container
            :layout.sync="layout"
            :cellSize="cellSize"
            :maxColumnCount="maxColumnCount"
            :maxRowCount="maxRowCount"
            :margin="margin"
            :bubbleUp="bubbleUp"
            
        >
            <dnd-grid-box
                boxId="settings"
                dragSelector="div.card-header"
            >
                <div class="card demo-box">

                    <div class="card-body row" style="background-color: red;">
                        <div class="form-group row">
                            <label for="settings-margin-input" class="row-sm-4 row-form-label">Margin</label>
                            <div class="col-sm-8">
                                <input class="form-control" type="number" v-model.number="margin" id="settings-margin-input">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="settings-grid-size-w-input" class="row-sm-4 rowl-form-label">Cell Size</label>
                            <div class="col-sm-4">
                                <input class="form-control" type="number" v-model.number="cellSize.w" id="settings-grid-size-w-input">
                            </div>
                            <div class="col-sm-4">
                                <input class="form-control" type="number" v-model.number="cellSize.h">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="settings-bubble-up-input" class="row-sm-4 row-form-label">Bubble Up</label>
                            <div class="row-sm-8">
                                <input type="checkbox" v-model="bubbleUp" id="settings-bubble-up-input">
                            </div>
                        </div>
                        <button class="btn btn-success" @click="boxCount++">Add Box</button>
                        <button class="btn btn-danger" @click="boxCount = Math.max(0, boxCount-1)">Remove Box</button>
                    </div>
                </div>
            </dnd-grid-box>
            <dnd-grid-box
                v-for="number in boxCount"
                :boxId="number"
                :key="number"
                dragSelector="div.card-header"
                resizeVisible
                offset
            >
                <div class="card demo-box">
                    <div class="card-header">
                        Box {{ number }}
                    </div>
                </div>
            </dnd-grid-box>
        </dnd-grid-container>
  <div class="components-container">
    <split-pane v-on:resize="resize" :min-percent='20' :default-percent='30' split="vertical">
      <template slot="paneL">
        <split-pane split="horizontal">
           <template slot="paneR">
        <div style="height: 100%; width:100%; background-color: orange;"></div>
      </template>
      <template slot="paneL"> 
         <div style="height: 100%; width:100%; background-color: pink;"></div>
          </template>
        </split-pane>
      </template>
      <template slot="paneR">
        <split-pane split="horizontal">
          <template slot="paneL">
           <div style="height: 100%; width:100%; background-color: yellow;"></div>
          </template>
          <template slot="paneR">
            <div style="height: 100%; width:100%; background-color: blue;"></div>
          </template>
        </split-pane>
      </template>
    </split-pane>
  </div> -->


<splitpanes id="adjustbro" v-press="onPress" class="default-theme" horizontal :push-other-panes="false" style="height: 100vh; width: 100vw;">
  <pane @resize="verticalTopSize = $event[0];resizeTOPHIGH();" ref="vertical_top">
  <splitpanes  @resize="topPaneWidthSize = $event[0];resizeTOPWIDE();"  :push-other-panes="false">
     <pane ref='top_left' > 
    <span style="display: flex; color: white; font-size: 6vw;">T.Left <span style="font-size: 4vw;">{{ topLeftpane}}%</span></span>
  </pane>
  <pane>
    <span style="display: flex; color: white; font-size: 6vw;">Header <span style="font-size: 4vw;">{{ topMiddlepane}}%</span></span>
  </pane>
   <pane ref='top_right' >
    <span style="display: flex; color: white; font-size: 6vw;">T.Right <span style="font-size: 4vw;">{{ topRightpane}}%</span></span>
  </pane>
  </splitpanes>
  </pane>
  <pane>
    <splitpanes @resize="middlePaneWideSize = $event[0]; resizeMIDDLEWIDE();" :push-other-panes="false">
      <pane ref="middle_left">
           <span style="display: flex; color: white; font-size: 6vw;">Left <span style="font-size: 4vw;">{{ middleLeftpane}}%</span></span>
      </pane>
      <pane>
          <span style="display: flex; color: white; font-size: 6vw;">middle <span style="font-size: 4vw;">{{middleMiddlepane}}%</span></span>
      </pane>
      <pane ref="middle_right">
       <span style="display: flex; color: white; font-size: 6vw;">Right <span style="font-size: 4vw;">{{ middleRightpane}}%</span></span>
      </pane>
    </splitpanes>
  </pane>
   <pane>
  <splitpanes @resize="bottomPaneWideSize = $event[0]; resizeBOTTOMWIDE();" :push-other-panes="false">
  <pane ref='bottom_left'>
    <span style="display: flex; color: white; font-size: 6vw;"> B.Left <span style="font-size: 4vw;">{{ bottomLeftpane}}%</span></span>
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


<!-- <ul v-pan="onPan" ref="list" class="slider__list">
  <li><div style="height: 20vh; width: 20vw; background-color: #bbb;"></div></li>
</ul>
<ul v-tap="onTap" ref="list" id="dude" class="slider__list">
  <li><div style="height: 20vh; width: 20vw; background-color: orange;"></div></li>
</ul>
<ul v-press="onPress" id="hey">
  <li><div style="height: 20vh; width: 20vw; background-color: pink;"></div></li>
  </ul>

<h2>{{tapOutput}}</h2>
<h2>{{slideOutput}}</h2>
<h2>{{pressOutput}}</h2> -->
  </div>
</template>

<script>
import { Container, Box } from '@dattn/dnd-grid';
import Vue from 'vue/dist/vue.js';
import splitPane from 'vue-splitpane';

import { Splitpanes, Pane } from 'splitpanes'
import 'splitpanes/dist/splitpanes.css'

Vue.component('split-pane', splitPane);
Vue.component('Container', Container); 
Vue.component('Box', Box);
export default {
  data: function () {
    return {
      paneWidth: 33.33,
       panesNumber: 5,
      topPaneWidthSize: 100, 
      middlePaneWideSize: 100,
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
      var test = this.$refs.vertical_top
      console.log(test)
    },
      testmethod(id){
        console.log(id)
      },
      widthOutput(){
       var globalwidth = this.paneSize.size
  console.log('hello')
        this.windowpanes.topLeftpane = globalwidth
        this.windowpanes.topRightpane = 100 - this.windowpanes.topLeftpane
        this.windowpanes.topMiddlepane = this.windowpanes.topLeftpane + this.windowpanes.topRightpane
     

      },
      heightOutput(){

      },
      resizeTOPWIDE(){
       this.topLeftpane = parseInt(this.$refs.top_left.style.width).toFixed()
       this.topMiddlepane = 100 - (parseInt(this.$refs.top_left.style.width) + parseInt(this.$refs.top_right.style.width))
       this.topRightpane = parseInt(this.$refs.top_right.style.width)
      },
       resizeMIDDLEWIDE(){
       this.middleLeftpane = parseInt(this.$refs.middle_left.style.width).toFixed()
       this.middleMiddlepane = 100 - (parseInt(this.$refs.middle_left.style.width) + parseInt(this.$refs.middle_right.style.width))
       this.middleRightpane = parseInt(this.$refs.middle_right.style.width)
      },
        resizeBOTTOMWIDE(){
       this.bottomLeftpane = parseInt(this.$refs.bottom_left.style.width).toFixed()
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
    console.log(event.target)
      },
      onPress(event){
        // this.pressOutput = event
        this.panesNumber++
        console.log(event)
        if(event.target.className == 'splitpanes__pane'){
          Vue.nextTick(function () {
                 var newDiv = '<splitpanes :push-other-panes="false" horizontal style="height: 100px"><div class="splitpanes__splitter" data-splitpanes-index="1"><span style="color: blue; font-size: 1.2em; height: 100%; width: 100%">Left</span></div></pane><div class="splitpanes__splitter"><pane><span style="color: blue; font-size: 1.2em; height: 100%; width: 100%">Center</span></pane></div><div class="splitpanes__splitter"><pane><span style="color: blue; font-size: 1.2em; height: 100%; width: 100%;">Right</span></pane></div></splitpanes>'
          var heyman =  event.target.firstChild
           return heyman.innerHTML = newDiv;
  // do something cool
})
     
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
        Pane,
      DndGridContainer: Container,
    DndGridBox: Box,

  }
}

</script>

<style scoped>
.splitpanes{display:-webkit-box;display:-ms-flexbox;display:flex;width:100%;height:100%}.splitpanes--vertical{-webkit-box-orient:horizontal;-webkit-box-direction:normal;-ms-flex-direction:row;flex-direction:row}.splitpanes--horizontal{-webkit-box-orient:vertical;-webkit-box-direction:normal;-ms-flex-direction:column;flex-direction:column}.splitpanes--dragging *{-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none}.splitpanes__pane{width:100%;height:100%;overflow:hidden;-webkit-transition:width .2s ease-out,height .2s ease-out;transition:width .2s ease-out,height .2s ease-out}.splitpanes--dragging .splitpanes__pane{-webkit-transition:none;transition:none}.splitpanes__splitter{-ms-touch-action:none;touch-action:none}.splitpanes--vertical>.splitpanes__splitter{min-width:3px;cursor:col-resize}.splitpanes--horizontal>.splitpanes__splitter{min-height:3px;cursor:row-resize}.splitpanes.default-theme .splitpanes__pane{background-color:#bbb}.splitpanes.default-theme .splitpanes__splitter{background-color:#fff;-webkit-box-sizing:border-box;box-sizing:border-box;position:relative}.splitpanes.default-theme .splitpanes__splitter:after,.splitpanes.default-theme .splitpanes__splitter:before{content:"";position:absolute;top:50%;left:50%;background-color:rgba(0,0,0,.15);-webkit-transition:background-color .3s;transition:background-color .3s}.splitpanes.default-theme .splitpanes__splitter:hover:after,.splitpanes.default-theme .splitpanes__splitter:hover:before{background-color:rgba(0,0,0,.25)}.default-theme.splitpanes .splitpanes .splitpanes__splitter{z-index:1}.default-theme.splitpanes--vertical>.splitpanes__splitter,.default-theme .splitpanes--vertical>.splitpanes__splitter{width:14px;border-left:1px solid rgb(255, 1, 1);margin-left:-1px}.default-theme.splitpanes--vertical>.splitpanes__splitter:after,.default-theme .splitpanes--vertical>.splitpanes__splitter:after,.default-theme.splitpanes--vertical>.splitpanes__splitter:before,.default-theme .splitpanes--vertical>.splitpanes__splitter:before{-webkit-transform:translateY(-50%);transform:translateY(-50%);width:1px;height:30px}.default-theme.splitpanes--vertical>.splitpanes__splitter:before,.default-theme .splitpanes--vertical>.splitpanes__splitter:before{margin-left:-2px}.default-theme.splitpanes--vertical>.splitpanes__splitter:after,.default-theme .splitpanes--vertical>.splitpanes__splitter:after{margin-left:1px}.default-theme.splitpanes--horizontal>.splitpanes__splitter,.default-theme .splitpanes--horizontal>.splitpanes__splitter{height:9px;border-top:1px solid #eee;margin-top:-1px}.default-theme.splitpanes--horizontal>.splitpanes__splitter:after,.default-theme .splitpanes--horizontal>.splitpanes__splitter:after,.default-theme.splitpanes--horizontal>.splitpanes__splitter:before,.default-theme .splitpanes--horizontal>.splitpanes__splitter:before{-webkit-transform:translateX(-50%);transform:translateX(-50%);width:30px;height:1px}.default-theme.splitpanes--horizontal>.splitpanes__splitter:before,.default-theme .splitpanes--horizontal>.splitpanes__splitter:before{margin-top:-2px}.default-theme.splitpanes--horizontal>.splitpanes__splitter:after,.default-theme .splitpanes--horizontal>.splitpanes__splitter:after{margin-top:1px}
.splitpanes__pane {
  justify-content: center;
  align-items: center;
  display: flex;
}
.splitpanes__splitter {
  background-color: #ccc;
  position: relative;
}
.splitpanes__splitter:before {
  content: "";
  position: absolute;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  transition: 0.4s;
}


.splitpanes > .splitpanes__splitter:before {
  left: -30px;
  right: -30px;
}
.splitpanes> .splitpanes__splitter:before {
  top: -30px;
  bottom: -30px;
}
.splitpanes__splitter:hover:before {
  background-color: rgba(255, 0, 0, 0.3);
}
/* splitpanes {
  justify-content: center;
  align-items: center;
  display: flex;
  height:100%;
  width: 100%;
}

pane {
  font-family: Helvetica, Arial, sans-serif;
  color: #fff;
    height: 100vh;
  width: 25vw;
  font-size: 5em;
  opacity: 0.6;
} */
.components-container {
		position: relative;
		height: 100vh;
	}
p {
  font-size: 2em;
  text-align: center;
}
  .dnd-grid-container {
      border: 2px solid black;

    }
  .demo-box {
        width: 100%;
        height: 100%;
    }
</style>
