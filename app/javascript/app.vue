<template>
  <div id="app">
<splitpanes v-press="onPress" ref='mainbackground' id="adjustfit" class="default-theme" horizontal :push-other-panes="false" @resize="resizeTOPHIGH();">
  <pane ref="vertical_top">
  <splitpanes :push-other-panes="false" @resize="resizeTOPWIDE();">
     <pane ref='top_left'> 
    <span class="panelLabels">T.Left</span> 
    <span  v-show="changedTop" :key="changedTop" class="valueOuput">W:{{ ShowPositions.topLeftpane}}% H:{{Math.round(ShowPositions.firstRow)}}%</span>
  </pane>
  <pane ref="top_middle">
    <span class="panelLabels">Header </span>
    <span  v-show="changedTop" :key="changedTop" class="valueOuput">W:{{ ShowPositions.topMiddlepane}}% H:{{Math.round(ShowPositions.firstRow)}}%</span>
  </pane>
   <pane ref='top_right'>
    <span class="panelLabels">T.Right </span>
     <span  v-show="changedTop" :key="changedTop" class="valueOuput">W:{{ShowPositions.topRightpane}}% H:{{Math.round(ShowPositions.firstRow)}}%</span>
  </pane>
  </splitpanes>
  </pane>
  <pane ref="vertical_middle">
    <splitpanes @resize="resizeMIDDLEWIDE();" :push-other-panes="false">
      <pane ref="middle_left">
           <span class="panelLabels">Left</span>
              <span class="valueOuput" v-show="changedTop" :key="changedTop" >W:{{ ShowPositions.middleLeftpane}}%H:{{Math.round(ShowPositions.secondRow)}}%</span>
      </pane>
      <pane ref="middle_middle">
          <span class="panelLabels">middle</span>
             <span class="valueOuput" v-show="changedTop" :key="changedTop" >W:{{ ShowPositions.middleMiddlepane}}%H:{{Math.round(ShowPositions.secondRow)}}%</span>
      </pane>
      <pane ref="middle_right">
       <span class="panelLabels">Right</span>
           <span class="valueOuput" v-show="changedTop" :key="changedTop" >W:{{ ShowPositions.middleRightpane}}%H:{{Math.round(ShowPositions.secondRow)}}%</span>
      </pane>
    </splitpanes>
  </pane>
   <pane ref="vertical_bottom">
  <splitpanes @resize="resizeBOTTOMWIDE();" :push-other-panes="false">
  <pane ref='bottom_left'>
    <span class="panelLabels"> B.Left </span>
      <span class="valueOuput" v-show="changedTop" :key="changedTop">W:{{ ShowPositions.bottomLeftpane}}%H:{{Math.round(ShowPositions.thirdRow)}}</span>
  </pane>
  <pane ref='bottom_middle'>
    <span class="panelLabels"> Footer </span>
      <span class="valueOuput" v-show="changedTop" :key="changedTop">W:{{ ShowPositions.bottomMiddlepane}}%H:{{Math.round(ShowPositions.thirdRow)}}</span>
  </pane>
   <pane ref="bottom_right">
    <span class="panelLabels"> B.Right</span>
       <span class="valueOuput" v-show="changedTop" :key="changedTop">W:{{ ShowPositions.bottomRightpane}}%H:{{Math.round(ShowPositions.thirdRow)}}</span>
  </pane>
  </splitpanes>
  </pane>
</splitpanes>
<app-add-feature :showFeatureAdd="showFeatureAdd"  :firstRow="ShowPositions" @update-close="update" @picture-add="addPictureUp"></app-add-feature>
<add-picture-menu :showPictureAdd="showPictureAdd" @inject-image="addImage"></add-picture-menu>
  </div>
</template>

<script>
import Vue from 'vue/dist/vue.js';
import AddFeatureComponent from './components/add_feature_menu.vue'
import { Splitpanes, Pane } from 'splitpanes'
import AddPictureMenu from './components/add_pictures.vue'

Vue.component('splitpanes', Splitpanes); 
Vue.component('pane', Pane)

export default {
  name: "app",
  data: function () {
    return {
      inputtedImage: '',
      selectedPane: '',
      imageAdded: null,
      showFeatureAdd: false,
      destroyVue: true,
      showPictureAdd: false,
      middlePaneWideSize: 100,
      changedTop: false,
      ShowPositions: {
        firstRow: 33, 
        secondRow: 33, 
        thirdRow: 33,
        topLeftpane: 33, 
        topMiddlepane: 33,
        topRightpane: 33,
        middleLeftpane: 33,
        middleMiddlepane: 33,
        middleRightpane: 33,
        bottomLeftpane: 33,
        bottomMiddlepane: 33,
        bottomRightpane: 33,
      },
    }
  },
  methods: {
    addImage(ImageAdd){
      var image = new Image();
      var reader = new FileReader();
      var vm = this;
     this.showPictureAdd= false, 
      this.showFeatureAdd=false
      reader.onload = (e) => {
         this.selectedPane.innerHTML = '<img ' + 'src= ' + e.target.result + ' height= "100%" width="100%"/>'
      };
      reader.readAsDataURL(ImageAdd);
      // this.imageAdded=ImageAdd
      // console.log(ImageAdd)
   
      

    },
    destroyVuejs(ShowVue){
      this.destroyVue=ShowVue
  console.log(ShowVue)
    },
    update(ShownFeature){
      this.showFeatureAdd=ShownFeature
    },
    addPictureUp(ShownPicture){
      this.showPictureAdd=ShownPicture
    },

    resizeTOPHIGH(){
      this.ShowPositions.firstRow = parseInt(this.$refs.vertical_top.style.height)
      this.ShowPositions.secondRow = parseInt(this.$refs.vertical_middle.style.height)
      this.ShowPositions.thirdRow = parseInt(this.$refs.vertical_bottom.style.height)
      this.changedTop = true
      setTimeout(function(){
       this.changedTop = false
      }, 1500)
  
    },
   resizeTOPWIDE(){
       this.ShowPositions.topLeftpane = parseInt(this.$refs.top_left.style.width)
       this.ShowPositions.topMiddlepane = 100 - (parseInt(this.$refs.top_left.style.width) + parseInt(this.$refs.top_right.style.width))
       this.ShowPositions.topRightpane = parseInt(this.$refs.top_right.style.width)
       this.changedTop = true
           setTimeout(function(){
        this.changedTop = false
      }, 1500)
  
      },
   
       resizeMIDDLEWIDE(){
       this.ShowPositions.middleLeftpane = parseInt(this.$refs.middle_left.style.width)
       this.ShowPositions.middleMiddlepane = 100 - (parseInt(this.$refs.middle_left.style.width) + parseInt(this.$refs.middle_right.style.width))
       this.ShowPositions.middleRightpane = parseInt(this.$refs.middle_right.style.width)
      },
        resizeBOTTOMWIDE(){
       this.ShowPositions.bottomLeftpane = parseInt(this.$refs.bottom_left.style.width)
       this.ShowPositions.bottomMiddlepane = 100 - (parseInt(this.$refs.bottom_left.style.width) + parseInt(this.$refs.bottom_right.style.width))
       this.ShowPositions.bottomRightpane = parseInt(this.$refs.bottom_right.style.width)
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
         event.preventDefault()
         console.log(event)
        if(event.target.className == 'splitpanes__pane'){
          this.selectedPane = event.target
          var test = this.selectedPane
          console.log(test)
           this.showFeatureAdd = true
        //  event.target.innerHTML = '<img src="https://bit.ly/34ebo0M" height= "100%" width="100%"></img>'
        }
      }
  },
watch: {
  showFeatureAdd: function(newvalue, oldvalue){
    if(newvalue == true){
    
    }
  },
    showPictureAdd: function(newvalue, oldvalue){
   
    if(newvalue == true){
     var test =  this.$refs.mainbackground
     test.$refs.container.style = "filter:opacity(0.7);filter:blur(10px);"
    }
    else if (newvalue == false){
    console.log('closing blur')
       var test =  this.$refs.mainbackground
     test.$refs.container.style = "filter:opacity(1);filter:blur(0px);"
    }
  }
},
  components: {
        Splitpanes,
        Pane,
        'app-add-feature':AddFeatureComponent, 
        'add-picture-menu': AddPictureMenu,

  }
}

</script>

<style scoped>
.valueOuput{
  font-size: 4vw;
}
.panelLabels{
  display: flex;
  color: white;
  font-size: 6vw;
}
#adjustfit{
  height: 100vh;
  width: 100vw;
  height: 100vh;
  width: 100vw; 
  margin-top: -60px;
  display: flex;
}



</style>
