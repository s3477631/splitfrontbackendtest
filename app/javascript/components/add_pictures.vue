<template>
<div v-if="showPictureAdd" class="ListContainer"> 
  <div @click="openCamera()" class="FromCamera"> 
      <span>Camera <i class="glyphicon glyphicon-camera"></i></span>
      </div>
      <div @click="openStorage()" class="FromStorage">
          <span>Storage <i class="glyphicon glyphicon-folder-open"></i>
          <input type="file" @change="addedImage" ref="inputtedImage" id="realInput" value=""/>
          </span>
          </div>
            <div id="videocontainer">
            <video autoplay="true" id="videoElement">
          </video>
      </div>
  </div>
  </template>
<script>
 import App from '../app.vue'
export default {
    name: "add_pictures",
    props:{
        showPictureAdd:{
            'type': Boolean
        }, 
    },
    methods: {
        addedImage(event){
    
        let ImageAdd = event.target.files[0]
            this.$emit('inject-image', ImageAdd);
        },
        openCamera(){
            var video = document.querySelector("#videoElement");

if (navigator.mediaDevices.getUserMedia) {
  navigator.mediaDevices.getUserMedia({ video: true })
    .then(function (stream) {
      video.srcObject = stream;
    })
    .catch(function (error) {
      console.log("Something went wrong!");
    });
}
            
        },
        openStorage(){
            var openrealbutton = document.getElementById('realInput');
            openrealbutton.click();
        }
    }
}
</script>
<style scoped>
.FromStorage input[type=file] {
  font-size: 100px;
  position: absolute;
  left: 0;
  top: 10vh;
  visibility: hidden;
}
i{
    height: 10vh;
    width:10vw;
}
.ListContainer{
    height: 40vh; 
    width: 80vw; 
    position: relative; 
    z-index: 5; 
    top: -100vh;
    left: 10vw;
    right: 10vw; 
     box-shadow: 5px 5px 5px 35px #868686;
    text-align: center;
    }
.FromCamera{
    height: 50%;
    width: 100%;
    background-color: rgb(0, 110, 255);
    
}
.FromStorage{
    height: 50%;
    width: 100%;
    background-color: rgb(255, 94, 0);
}
span{
    color: white;
    font-size: 10vh;
}
#videocontainer{
    position: relative;
    z-index: 7; 
    top: -30%;
    right: 20%;
    left: 20%;
    height: 100%; 
    width: 80%; 
}
</style>