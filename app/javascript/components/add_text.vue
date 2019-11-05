<template>
<div v-if="showTextMenu" class="ListContainer"> 
    <textarea @change="update" :value="inputText"></textarea>
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
      data: function () {
        return{
            inputText: ''
        }
        methods: {
            update(value)
        }
    }
}
</script>
<style scoped>
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
    font-size: 4vh; 
    font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
    background-color: skyblue; 
}
</style>
