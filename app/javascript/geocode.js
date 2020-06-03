import mapboxgl from 'mapbox-gl';

const injectCoordinates = (coordinates) => {
  const paragraphElement = document.getElementById('coordinates');
  paragraphElement.innerText = `${coordinates.lat}, ${coordinates.lng}`;
};

const injectMap = (coordinates) => {
  const lng = coordinates.lng;
  const lat = coordinates.lat;

  mapboxgl.accessToken;
  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/pdunleav/cjofefl7u3j3e2sp0ylex3cyb',
    center: [ lng, lat ],
    zoom: 12
  });
  new mapboxgl.Marker()
    .setLngLat([ lng, lat ])
    .addTo(map);
};

export { injectCoordinates, injectMap };
