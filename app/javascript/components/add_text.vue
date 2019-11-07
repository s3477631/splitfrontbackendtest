<template>
<div v-if="showTextMenu" class="ListContainer"> 
<div class="mb-5">
    <input style="width: 100%;" autofocus type="text" v-model="childMessage" @keydown="emitToParent"/>
</div>
    <button @click="closeTextMenu">Submit</button>
  
  </div>
</template>
<script>
import App from '../app.vue'
export default {
    name: 'add_text',
     props:{
        showTextMenu:{
            'type': Boolean
        }, 
    },
      data(){
        return{
          childMessage: '',
        }
      },
        methods: {
         emitToParent (event) {
             var filter = event.key
             if (filter!== undefined) {
             if(filter != "Shift" && filter != "Backspace" && filter != "Meta" && filter != "Enter"){
                this.$emit('childToParent', filter)
             }
             }
             },
             closeTextMenu(){
                 let ShownFeature = false
                 this.$emit("addtext_close", ShownFeature)
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
