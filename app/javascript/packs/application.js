/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import Hammer from 'hammerjs';

import 'splitpanes/dist/splitpanes.css';
import Vue from 'vue/dist/vue.js';
import App from '../app.vue';





Vue.component('app', App)
document.addEventListener('DOMContentLoaded', (e) => {
   
    // if(e.srcElement.URL == 'http:/localhost:3000/webcodes'){
    //     console.log('fuck a donkey')
    //    }
  const app = new Vue({
    el: '[data-behavior="vue"]',
  })
 console.log(app)
})

Vue.directive("pan", {
    bind: function(el, binding) {
      if (typeof binding.value === "function") {
        const mc = new Hammer(el);
        mc.get("pan").set({ direction: Hammer.DIRECTION_ALL });
        mc.on("pan", binding.value);
      }
    }
  });

  Vue.directive("tap", {
	bind: function(el, binding) {
		if (typeof binding.value === "function") {
			const mc = new Hammer(el);
			mc.on("tap", binding.value);
		}
	}
});

Vue.directive("press", { 
    bind: function(el, binding){
        if (typeof binding.value === "function") {
            const mc = new Hammer(el);
			mc.on("press", binding.value);
        }
    }
});