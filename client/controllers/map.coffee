Template.map.rendered = () ->
  latLngs = ([location.locationLatitude, location.locationLongitude] for location in @data.location)
  if latLngs.length is 1
    eventMap = L.map('map').setView(latLngs[0], 4)
  else
    eventMap = L.map('map').fitBounds(latLngs, {padding: [15,15]})
  for latLng in latLngs
    L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', 
      attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors')
      .addTo eventMap
    circle = L.circleMarker(latLng, {
      stroke: false
      fillColor: '#1BAA4A',
      fillOpacity: 0.8,
    }).addTo(eventMap)