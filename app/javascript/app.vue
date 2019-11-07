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
<app-add-feature :showFeatureAdd="showFeatureAdd"  @video-add="openVideomenu" @text-add="openTextmenu" :firstRow="ShowPositions" @update-close="update" @picture-add="addPictureUp"></app-add-feature>
<add-picture-menu :showPictureAdd="showPictureAdd" @inject-image="addImage"></add-picture-menu>
<add-text-menu @childToParent="onChildClick" @addtext_close="hideTextmenu"  :showTextMenu="showTextMenu"></add-text-menu>
 <add-video @videoToMain="onVideoenter" @add-video-close="hideVideomenu" :showVideoMenu="showVideoMenu"></add-video>
  </div>
</template>


<script>
import Vue from 'vue/dist/vue.js';
import AddFeatureComponent from './components/add_feature_menu.vue'
import { Splitpanes, Pane } from 'splitpanes'
import AddPictureMenu from './components/add_pictures.vue'
import AddText from './components/add_text.vue'
import AddVideo from './components/add_video.vue'



Vue.component('splitpanes', Splitpanes); 
Vue.component('pane', Pane)

export default {
  name: "app",
  data: function () {
    return {
      showVideoMenu: false,
      showTextMenu: false,
      inputtedText: [],
      inputtedImage: '',
      selectedPane: '',
      videoUrl: '',
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
    hideVideomenu(CloseVideo){
      this.showVideoMenu=CloseVideo
    },
    hideTextmenu(CloseText){
      this.showTextMenu=CloseText
    },

      onVideoenter(value){
        this.videoUrl = value
            this.selectedPane.innerHTML = '<iframe style="width: 100%; height: 100%;" src="' + this.videoUrl  + '" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>'
      },

      openVideomenu(OpenVideo){
        this.showVideoMenu=OpenVideo
      },

       onChildClick (value) {
            this.inputtedText.push(value)
            this.addText()
            console.log(value)
    },
    openTextmenu(AddTexte){
         this.showTextMenu=AddTexte
    },
    addText(AddTexte){
      var addedInput = (this.inputtedText).toString()
      if (addedInput != 'Shift' && addedInput != 'Backspace'){
     var alteredInput =  addedInput.replace(/\,/gm,'')
      this.selectedPane.innerHTML = '<div style="width: 100%; height: 100%; background-color: lightskyblue; color: white; font-size: 6vh;">' + alteredInput + '</div>'
      }
    },
    onClickChild (value) {
      console.log(value) // someValue
    },
    addVideo(VideoAdd){
    this.selectedPane.innerHTML = '<iframe style="width: 100%; height: 100%;" src="https://www.youtube.com/embed/videoseries?list=PLx0sYbCqOb8TBPRdmBHs5Iftvv9TPboYG" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>'
    },

    addImage(ImageAdd){
      var image = new Image();
      var reader = new FileReader();
      var vm = this;
     this.showPictureAdd= false, 
      this.showFeatureAdd=false
      
      reader.onload = (e) => {
        var testType = e.target.result   
          console.log(testType)
      if (testType.includes('video')){
        console.log(e.target)
        console.log('IT WORKED')
         this.selectedPane.innerHTML = '<video autoplay controls height="100%" width="100%" src=' + e.target.result +  '> ' + '</video>'
      }
      else{
         this.selectedPane.innerHTML = '<img ' + 'src= ' + e.target.result + ' height= "100%" width="100%"/>'
        } 
      };
      reader.readAsDataURL(ImageAdd);
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
        var test =  this.$refs.mainbackground
     test.$refs.container.style = "filter:opacity(0.7);filter:blur(10px);"
    }
     else if (newvalue == false){
    console.log('closing blur')
       var test =  this.$refs.mainbackground
     test.$refs.container.style = "filter:opacity(1);filter:blur(0px);"
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
        'add-text-menu': AddText,
        'add-video': AddVideo
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
