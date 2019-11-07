<template>
<div v-if="showPictureAdd" class="ListContainer"> 
      <div @click="openStorage()" class="FromStorage row justify-self-center align-items-center">
          <span>From Storage <i class="fas fa-folder"></i>
          <input type="file" @change="addedImage" ref="inputtedImage" id="realInput" value=""/>
          </span>
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
.FromStorage{
    height: 100%;
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
    /* height: 100%; 
    width: 80%;  */
    height: 100vh;
    width: 100vw;
}
</style>