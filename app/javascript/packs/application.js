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
import { initAutocomplete } from '../plugins/init_autocomplete';
import { initMapbox } from '../plugins/init_mapbox';

document.addEventListener('turbolinks:load', () => {
  initAutocomplete();
  initMapbox();
})

import "../plugins/flatpickr"

const input1 = document.getElementById('booking_start_date_1i');
const input2 = document.getElementById('booking_start_date_2i');
const input3 = document.getElementById('booking_start_date_3i');

const getMonths = (number) => {
  let month = "january"
 switch (number) {
  case "1":
    month = "January";
    break;
  case "2":
      month = "February";
    break;
  case "3":
      month = "March";
    break;
  case "4":
      month = "April";
    break;
  case "5":
      month = "May";
    break;
  case "6":
      month = "June";
    break;
  case "7":
      month = "July";
    break;
  case "8":
      month = "August";
    break;
  case "9":
      month = "September";
    break;
  case "10":
      month = "October";
    break;
  case "11":
      month = "November";
    break;
  case "12":
      month = "December";
    break;
}
return month
}

input1.addEventListener('change', (event) => {
  const result = document.getElementById('start_date_2');
  result.textContent = input3.value + " " + getMonths(input2.value) + " " + event.target.value;
});

input2.addEventListener('change', (event) => {
  const result = document.getElementById('start_date_2');
  result.textContent = input3.value + " " + getMonths(event.target.value) + " " + input1.value;
});

input3.addEventListener('change', (event) => {
  const result = document.getElementById('start_date_2');
  result.textContent = event.target.value + " " + getMonths(input2.value)+ " " + input1.value;
});

const input4 = document.getElementById('booking_end_date_1i');
const input5 = document.getElementById('booking_end_date_2i');
const input6 = document.getElementById('booking_end_date_3i');

input4.addEventListener('change', (event) => {
  const result = document.getElementById('end_date_2');
  result.textContent = input6.value + " " + getMonths(input5.value) + " " + event.target.value;
});

input5.addEventListener('change', (event) => {
  const result = document.getElementById('end_date_2');
  result.textContent = input6.value + " " + getMonths(event.target.value) + " " + input4.value;
});

input6.addEventListener('change', (event) => {
  const result = document.getElementById('end_date_2');
  result.textContent = event.target.value + " " + getMonths(input5.value) + " " + input4.value;
});
