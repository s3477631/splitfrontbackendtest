<template>
<div v-if="showFeatureAdd" class="ListContainer">   
    <ul class="grid-container">
      <li class="grid-item"><button @click="showPositions()" @onTap="showPositions()">FINISH<i class="glyphicon glyphicon-flag"></i></button></li>
      <li class="grid-item"><button @click="openpictures()" @onTap="openpictures()"><i class="glyphicon glyphicon-picture"></i>|<i class="glyphicon glyphicon-camera"></i><i></i></button></li>
       <li class="grid-item"><button>BLANK SPACE <i class="glyphicon glyphicon-th-large"></i></button></li>
       <li class="grid-item"><button @click="insertTable()">Table <i class="glyphicon glyphicon-calendar"></i></button></li>
        <li class="grid-item"><button@click="insertText()">Text<i class="glyphicon glyphicon-text-size"></i></button></li>
            <li class="grid-item"><input type="text" placeholder="insert video link" @input="updateVideoLink" style="color: black;" :value="VideoLink"><button @click="insertVideo">Video<i class="glyphicon glyphicon-film"></i></button></li>
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
        insertText(){
        let ShownText = true 
        this.$emit("text-add", ShownText);
        this.closeFeatureAdd()
        },
        insertTable(){
        let ShownTable = true 
        this.$emit("table-add", ShownTable);
        this.closeFeatureAdd()
        },
        insertVideo(){
         let ShownFeature = false
        this.$emit("video-add", ShownFeature);
        this.closeFeatureAdd()
        },
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


.grid-container{
    display: grid; 
    grid-template-columns: 26.67vw 26.67vw 26.67vw;
    grid-template-rows: 16vh 16vh;
}


  i{
   width: 10vw;
   font-size: 4vh;
  }

  i > button {
         display: inline-flex; 
      align-items: center;
     justify-self: space-between;
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
input {
    width: 100%;
}
ul{
    list-style: none;
}
li{
    color: white;
    width: 100%;
}
li > button{
       background-color: rgb(255, 115, 0); 
    height: 100%; 
    width: 100%;
    color: white; 
    font-weight: bold;
    
}

li > input{ 
    width: 100%; 
}

li:nth-child(odd)  > button{
    background-color: rgb(25, 0, 255); 
    height: 100%; 
    width: 100%;
    color: white; 
    font-weight: bold;
}

.closeBTN{
    width: 100%;
    color: white;
    background-color: green;  
    position: absolute; 
    bottom: 0;
    height: 8vh;
}

  </style>