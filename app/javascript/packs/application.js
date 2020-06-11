// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { previewImageOnFileSelect } from '../components/photo_preview.js';
previewImageOnFileSelect();

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
});

import { initMapbox } from '../plugins/init_mapbox';

document.addEventListener('turbolinks:load', () => {
  initMapbox();
})

import "../plugins/flatpickr"

const input1 = document.getElementById('booking_start_date_1i');
const input2 = document.getElementById('booking_start_date_2i');
const input3 = document.getElementById('booking_start_date_3i');

input1.addEventListener('change', (event) => {
  const result = document.getElementById('start_date_2');
  result.textContent = input3.value + "/" + input2.value + "/" + event.target.value;
});

input2.addEventListener('change', (event) => {
  const result = document.getElementById('start_date_2');
  result.textContent = input3.value + "/" + event.target.value + "/" + input1.value;
});

input3.addEventListener('change', (event) => {
  const result = document.getElementById('start_date_2');
  result.textContent = event.target.value + "/" + input2.value + "/" + input1.value;
});

const input4 = document.getElementById('booking_end_date_1i');
const input5 = document.getElementById('booking_end_date_2i');
const input6 = document.getElementById('booking_end_date_3i');

input4.addEventListener('change', (event) => {
  const result = document.getElementById('end_date_2');
  result.textContent = input6.value + "/" + input5.value + "/" + event.target.value;
});

input5.addEventListener('change', (event) => {
  const result = document.getElementById('end_date_2');
  result.textContent = input6.value + "/" + event.target.value + "/" + input4.value;
});

input6.addEventListener('change', (event) => {
  const result = document.getElementById('end_date_2');
  result.textContent = event.target.value + "/" + input5.value + "/" + input4.value;
});
