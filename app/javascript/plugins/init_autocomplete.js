import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('flat_address');
  if (addressInput) {
    places({ container: addressInput });
  }
  const locationInput = document.getElementById('flat_location');
  if (locationInput) {
    places({ container: locationInput });
  }
};

export { initAutocomplete };
