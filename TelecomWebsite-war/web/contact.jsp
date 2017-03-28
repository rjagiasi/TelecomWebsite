<%-- 
    Document   : contact
    Created on : 29 Mar, 2017, 1:21:22 AM
    Author     : rohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="constants.ProjectDetails"%>

<%@ include file="header.jsp"%>
<%
	String map_src = "http://maps.googleapis.com/maps/api/js?key=" + ProjectDetails.GoogleMapApiKey;
%>

<style>
    #map-canvas{
        position: relative;
	height: 60%;
	width: 95%;
	margin: 20px;
}
    
</style>
<script type="text/javascript" src=<%=map_src%>></script>

<script type="text/javascript">
	var geocoder = new google.maps.Geocoder();
	var map;

	var markersArray = [];
	var locationsArray = [ "Thane", "Mulund", "Dadar", "Byculla" ];

	var locationMarkersArray = [];
	
	function clearOverlays() {
		for (var i = 0; i < markersArray.length; i++) {
			markersArray[i].setMap(null);
		}
		markersArray.length = 0;
	}


	function generateShops() {
		clearOverlays();
		locationsArray.forEach(function (item, index)
		{
			callGeocoder(item, locationMarkersArray, "shop");
		});
	}
	
	
	
	function initialize() {
		
		var latlng = new google.maps.LatLng(19.07598, 72.87765590);
		var mapOptions = {
			zoom : 10,
			center : latlng,

		}
		map = new google.maps.Map(document.getElementById('map-canvas'),
				mapOptions);
		
		generateShops();
	}

	function callGeocoder(address, array, type) {
		//alert(address);
		geocoder.geocode({
			'address' : address
		}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				map.setCenter(results[0].geometry.location);
				
				clearOverlays();
				var icontype = (type=="shop")?"shop.png":"search.png";
				
				var icon = {
					    url: "imgs/"+icontype, // url
					    scaledSize: new google.maps.Size(30, 30), // scaled size
					    origin: new google.maps.Point(0,0), // origin
					    anchor: new google.maps.Point(0, 0) // anchor
					};
				
				array.push(new google.maps.Marker({
					map : map,
					position : results[0].geometry.location,
					//label : address,
					icon : icon,
				}));

			} else {
				alert('Geocode was not successful for the following reason: '
						+ status);
			}
		});
	}

	function codeAddress() {
		var address = document.getElementById('address').value;
		callGeocoder(address, markersArray, "search");
	}

	google.maps.event.addDomListener(window, 'load', initialize);
	
</script>

<div>
	<h3>Location Finder using Google Maps API</h3>
	Enter your Location: <input id="address" type="textbox" value="Mumbai">
	<input type="button" value="Find" onclick="codeAddress()" autocomplete>
</div>
<div id="map-canvas"></div>

<%@ include file="footer.jsp"%>
