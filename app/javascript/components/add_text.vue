<template>
<div v-if="showTextMenu" class="ListContainer"> 

    <input type="text" v-model="childMessage" @keyup="emitToParent"/>
    <button>Submit</button>
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
      this.$emit('childToParent', event)
    }
        }
}
</script>
<style scoped>
button {
    width: 100%; 
    height: 10vh;
    color: white; 
    background-color: rgb(253, 115, 34);
}
.ListContainer{
    height: 40vh; 
    width: 80vw; 
    background-color: red;
     position: relative; 
     z-index: 3; 
     top: -100vh;
      left: 10vw;
       right: 10vw; 
}
textarea {
    max-height: 30vh; 
    max-width:80vw;
    height: 30vh; 
    width: 80vw;
    color: white; 
    font-size: 7vh; 
    font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
    background-color: skyblue; 
}
</style>
