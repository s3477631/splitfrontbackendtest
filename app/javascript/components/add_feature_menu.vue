<template>
<div v-if="showFeatureAdd" class="ListContainer">   
    <ul>
      <li><button @click="showPositions()" @onTap="showPositions()">FINISH</button></li>
      <li><button @click="openpictures()" @onTap="openpictures()"> PICTURE</button></li>
       <li><button>VIDEO</button></li>
        <li><button>BLANK SPACE</button></li>
         <li><button>TEXT</button></li>
    </ul>
    <button class='closeBTN' @click="closeFeatureAdd()">CLOSE</button>
  </div>
  </template>
  <script> 
  import App from '../app.vue'
  const axios = require('axios');
export default {
    name: "add_features",
    props: {
        showFeatureAdd:{
            'type': Boolean
        }, 
            firstRow:{
            }, 
        
    
    }, 

    methods:{
          closeFeatureAdd(){
        let ShownFeature = false
        this.$emit("update-close", ShownFeature);
       
    },
        showPositions(){
         
        var positions = this.firstRow
        console.log(positions)
        axios({
            method: 'post', 
            url: '/webcodes',
            data: {
                bottom_l: 33,
                bottom_m:33,
                bottom_r:33
            }
        })
  
        },
        openpictures(){
             let ShownPicture = true 
            this.$emit("picture-add", ShownPicture);
          this.closeFeatureAdd()
            
        },
},
}

  </script>
  <style scoped>
.ListContainer{
    height: 30vh; 
    width: 80vw; 
    background-color: red;
     position: relative; 
     z-index: 3; 
     top: -100vh;
      left: 10vw;
       right: 10vw; 
       border: 1px solid orange;
}
input {
    width: 100%;
}
ul{
    list-style: none;
}
li{
    height: 15%;
    color: white;
    width: 100%;
    background: green; 
    border: 1px solid black;
     border-radius: 3px;
}
li > button{
       background-color: rgb(255, 0, 64); 
    height: 100%; 
    width: 100%;
    color: white; 
    height: 5vh;
    font-weight: bold;
    
}

li:nth-child(odd)  > button{
    background-color: rgb(25, 0, 255); 
    height: 100%; 
    width: 100%;
    color: white; 
    height: 5vh;
    font-weight: bold;
}

.closeBTN{
    width: 100%;
    color: white;
    background-color: red;  
    position: absolute; 
    bottom: 0;
    height: 5vh;
}

  </style>