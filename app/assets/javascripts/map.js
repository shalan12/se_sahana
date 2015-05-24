(function($) {
	var $mapCanvas = $('.map-canvas');
	var $mapInput = $('[name="map-input"]');
	var map, searchMarkers = [], emergencyMarkers = [];
	var currentLocation, curMarker;

	var emergenciesRoute = '/emergencies';

	var $latField = $('[name="emergency[lat]"]');
	var $longField = $('[name="emergency[long]"]');

	var emergencySymbol = {
	    path: 'M 50 -119.876 -50 -119.876 -50 -19.876 -13.232 -19.876 0.199 0 13.63 -19.876 50 -19.876 Z',
	    fillColor: '#a20000',
	    fillOpacity: 1,
	    strokeColor: '#ffffff',
	    strokeWeight: 2,
	    strokeOpacity: 0.8,
	    scale: 0.2
	};

	var locationSymbol = {
	    path: 'M0-165c-27.618 0-50 21.966-50 49.054C-50-88.849 0 0 0 0s50-88.849 50-115.946C50-143.034 27.605-165 0-165z',
	    fillColor: '#0AA64D',
	    fillOpacity: 1,
	    strokeColor: '#ffffff',
	    strokeWeight: 2,
	    strokeOpacity: 0.8,
	    scale: 0.2
	};

	Utils.beginRecievingLocation(500, onLocationReceived);

	if($mapCanvas.length && $mapInput.length) {
		initMap($mapCanvas.get(0),$mapInput.get(0));
		getEmergencies();
	}

	function update() {
		if(map) {
			if(currentLocation) {
			}
		}
	}

	function plotEmergencies(emergencies) {
		clearMarkers(emergencyMarkers);
		for(var i = 0; i < emergencies.length; i++) {
			var emergency = emergencies[i];
			var latlng = new google.maps.LatLng(emergency['lat'], emergency['long']);
			var marker = createMarker(map,emergencySymbol,emergency['emergency_type'],latlng);
			emergencyMarkers.push(marker);

			var message = emergency['emergency_type'] + ' needs Rs.' + emergency['amount_needed'] + ' ... ' + '<a href=' + emergenciesRoute + '/' + emergency['id'] + '>read more</a>';
			addInfoWindow(marker,message);
		}
	}

	function getEmergencies() {
		$.get(emergenciesRoute, function(data) {
			console.log('got emergencies');
			plotEmergencies(data);
		}).fail(function(){
			console.error('error while getting emergencies');
		})
	}

	function updateFormFieldIfAny() {
		if(currentLocation && $latField.length && $longField.length) {
			console.log('updating fields');
			$latField.val(currentLocation[0]);
			$longField.val(currentLocation[1]);
		} else {
			console.log('not here');
		}
	}

	function onLocationReceived(location) {
		var isFirst = currentLocation ? false : true;
		currentLocation = [location.coords.latitude, location.coords.longitude];
		if(isFirst && map) {
			var gloc = new google.maps.LatLng(currentLocation[0], currentLocation[1]);
			map.panTo(gloc);
			map.setZoom(17);

			if(!curMarker) {
				var message = "you are here douche-bag";

				curMarker = createMarker(map,locationSymbol,message,gloc);
				addInfoWindow(curMarker,message);
			} else {
				curMarker.setPosition(gloc);
			}
		}
		update();
		updateFormFieldIfAny();
	}

	function initMap(mapCanvas, mapInput) {
		var mapOptions = {
			zoom: 6,
			center: new google.maps.LatLng(31.5450500, 74.3406830),
			mapTypeControl: false,
			mapTypeId: google.maps.MapTypeId.ROADMAP
		};

		map = new google.maps.Map(mapCanvas, mapOptions);

		//-------------------------------------------------------------------------
		// search box
		//-------------------------------------------------------------------------
		map.controls[google.maps.ControlPosition.TOP_LEFT].push(mapInput);

		var searchBox = new google.maps.places.SearchBox((mapInput));

		google.maps.event.addListener(searchBox, 'places_changed', function() {
			var places = searchBox.getPlaces();

			if (places.length == 0) {
			  return;
			}

			clearMarkers(searchMarkers);

			var bounds = new google.maps.LatLngBounds();

			for (var i = 0, place; place = places[i]; i++) {
				var image = {
					url: place.icon,
					size: new google.maps.Size(71, 71),
					origin: new google.maps.Point(0, 0),
					anchor: new google.maps.Point(17, 34),
					scaledSize: new google.maps.Size(25, 25)
				};

				var marker = createMarker(map,image,place.name, place.geometry.location);
				searchMarkers.push(marker);

				bounds.extend(place.geometry.location);
			}

			map.fitBounds(bounds);
		});

		// bias search results within the visible area
		google.maps.event.addListener(map, 'bounds_changed', function() {
			var bounds = map.getBounds();
			searchBox.setBounds(bounds);
		});
		//-------------------------------------------------------------------------
	}

	function createMarker(map, icon, title, position) {
		var marker = new google.maps.Marker({
			map: map,
			icon: icon,
			title: title,
			position: position
		});
		return marker;
	}

	function addInfoWindow(marker, message) {
		marker['infoWindow'] = new google.maps.InfoWindow({
            content: message
        });

		google.maps.event.addListener(marker, 'click', function() {
	      this['infoWindow'].open(map,this);
	    });
	}

	function clearMarkers(list) {
		for(var i = 0; i < list.length; i++) {
			list[i].setMap(null);
		}
		list.length = 0;
	}
})(jQuery);
