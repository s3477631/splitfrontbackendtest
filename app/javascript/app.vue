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
  </div>
</template>

<script>
import { Container, Box } from '@dattn/dnd-grid';
import Vue from 'vue/dist/vue.js';
Vue.component('Container', Container); 
Vue.component('Box', Box);
export default {
  data: function () {
    return {

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
      
      DndGridContainer: Container,
    DndGridBox: Box,

  }
}

</script>

<style scoped>
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
