<template>
  <div id="app">
 <dnd-grid-container
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
  </div>
<splitpanes class="default-theme" horizontal :push-other-panes="false" style="height: 400px">
  <pane>
    <span>1</span>
  </pane>
  <pane>
    <splitpanes :push-other-panes="false">
      <pane>
        <span>2</span>
      </pane>
      <pane>
        <span>3</span>
      </pane>
      <pane>
        <span>4</span>
      </pane>
    </splitpanes>
  </pane>
  <pane>
    <span>5</span>
  </pane>
</splitpanes>

<ul v-pan="onPan" ref="list" class="slider__list">
  <li><div style="height: 20vh; width: 20vw; background-color: #bbb;"></div></li>
</ul>
<ul v-tap="onTap" ref="list" class="slider__list">
  <li><div style="height: 20vh; width: 20vw; background-color: orange;"></div></li>
</ul>
<ul v-press="onPress">
  <li><div style="height: 20vh; width: 20vw; background-color: pink;"></div></li>
  </ul>

<h2>{{tapOutput}}</h2>
<h2>{{slideOutput}}</h2>
  </div>
</template>

<script>
import { Container, Box } from '@dattn/dnd-grid';
import Vue from 'vue/dist/vue.js';
import splitPane from 'vue-splitpane';

import { Splitpanes, Pane } from 'splitpanes'


Vue.component('split-pane', splitPane);
Vue.component('Container', Container); 
Vue.component('Box', Box);
export default {
  data: function () {
    return {
      paneSize: 33,
      slideOutput: '', 
      tapOutput: '',
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
            }
        },
  methods: {
      resize(){
        console.log('resize')
      },
       onPan(event) {
          this.slideOutput = event;
      const deltaX = event.deltaX; // moved distance on x-axis
      const deltaY = event.deltaY; // moved distance on y-axis
      const isFinal = event.isFinal; // pan released
      const direction = event.direction; // 0 = none, 2 = left, 4 = right, 8 = up, 16 = down,
    },
      onTap(event){  
      this.tapOutput = event
      },
      onPress(event){
        console.log(event)
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
splitpanes {
  justify-content: center;
  align-items: center;
  display: flex;
  height:100vh;
  width: 100vw;
}

pane {
  font-family: Helvetica, Arial, sans-serif;
  color: #fff;
    height: 100vh;
  width: 25vw;
  font-size: 5em;
  opacity: 0.6;
}
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
