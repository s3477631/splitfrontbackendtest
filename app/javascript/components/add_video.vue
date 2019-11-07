<template>
<div v-if="showVideoMenu" class="ListContainer"> 
<div class="mb-5">
    <input style="width: 100%;" autofocus type="text" v-model="videolinkurl" @keyup="emitVideoApp"/>
</div>
    <button @click="closeVideo">Submit</button>
  
  </div>
</template>
<script>
import App from '../app.vue'
export default {
    name: 'add_video',
     props:{
        showVideoMenu:{
            'type': Boolean
        }, 
    },
      data(){
        return{
          videolinkurl: '',
        }
      },
        methods: {
         emitVideoApp (event) {
      this.$emit('videoToMain', this.videolinkurl)
             }, 
             closeVideo(){
                 let ShownFeature = false
                 this.$emit('add-video-close', ShownFeature)
             }
  }
}
</script>
<style scoped>
button {
    width: 100%; 
    height: 10vh;
    color: white; 
    background-color: rgb(253, 67, 34);
}
.ListContainer{
    height: 20vh; 
    width: 80vw; 
    background-color: skyblue;
     position: relative; 
     z-index: 3; 
     top: -100vh;
      left: 10vw;
       right: 10vw; 
}

</style>
