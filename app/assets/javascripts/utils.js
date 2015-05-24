Utils = {
	beginRecievingLocation: function(interval, callback) {
		setInterval(function() {
			if (navigator.geolocation) {
		        navigator.geolocation.getCurrentPosition(callback);
		    }
		},interval);
	}
}