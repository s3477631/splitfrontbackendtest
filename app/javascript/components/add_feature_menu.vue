<template>
<div v-if="showFeatureAdd" class="ListContainer">   
    <ul>
      <li><button @click="showPositions()" @onTap="showPositions()">FINISH</button></li>
      <li><button @click="openpictures()" @onTap="openpictures()"><i class="glyphicon glyphicon-picture"></i>PICTURE</button></li>
       <li><input type="text" placeholder="insert video link" @input="updateVideoLink" style="color: black;" :value="VideoLink"></li>
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
    data(){
        return{
            VideoLink: ''
        }
    },
    methods:{
        updateVideoLink(event){
           console.log(event.target.value)

        },
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
                bottom_l: positions.bottomLeftpane,
                bottom_m: positions.bottomMiddlepane, 
                bottom_r: positions.bottomRightpane, 
                middle_l: positions.middleLeftpane, 
                middle_m: positions.middleMiddlepane,
                middle_r: positions.middleRightpane,
                top_l: positions.topLeftpane,
                top_m: positions.topMiddlepane,
                top_r: positions.topRightpane,
                firstRow: positions.firstRow, 
                secondRow: positions.secondRow, 
                thirdRow: positions.thirdRow

            },
             headers: {'Content-Type': 'application/json'}
                 }).then(function (response) {
                    window.location.href="/webcodes"
                })
            .catch(function (error) {
               console.log(error.response);
                });
                 this.redirectPage()

        },
        redirectPage(){
                let ShowVue = false
            this.$emit("close-vuejs", ShowVue);
    
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

li > input{ 
    width: 100%; 
    height: 5vh;
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