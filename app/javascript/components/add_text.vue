<template>
<div v-if="showTextMenu" class="ListContainer"> 
    <textarea></textarea>
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
    height: 30vh; 
    width:80vw;
}
</style>
