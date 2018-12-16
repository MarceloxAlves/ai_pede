import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MLocation {
  double latitude;
  double longitude;

  MLocation(this.latitude, this.longitude);
}

MLocation _location = MLocation(-5.1192357, -42.7868127);

getLocation() async {
  var currentLocation = <String, double>{};
  var location = new Location();
  try {
    currentLocation = await location.getLocation();
  } on Exception {
    currentLocation = {"latitude": 0.0, "longitude": 0.0};
  }
  _location =
      new MLocation(currentLocation['latitude'], currentLocation['longitude']);
}

class MapsPanificadoras extends StatelessWidget {
  GoogleMapController mapController;
  LatLng _center;
  List<DocumentSnapshot> _querySnapshot;

  MapsPanificadoras(this._querySnapshot);

  @override
  Widget build(BuildContext context) {
    if(_location == null){
      getLocation();
    }
    print("latitude:" +
        _location.latitude.toString() +
        "longitude:" +
        _location.longitude.toString());
    _center = LatLng(_location.latitude, _location.longitude);

    return Stack(children: <Widget>[
      SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          options: GoogleMapOptions(
            cameraPosition: CameraPosition(
              target: _center,
              zoom: 14.0,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.topRight,
          child: FloatingActionButton(
            onPressed: () => print('button pressed'),
            materialTapTargetSize: MaterialTapTargetSize.padded,
            backgroundColor: Colors.deepOrange,
            foregroundColor: Colors.white,
            child: const Icon(Icons.search, size: 36.0),
          ),
        ),
      ),
    ]);
  }

  _onMapCreated(GoogleMapController controller) {
    _querySnapshot.forEach((doc) {
      controller.addMarker(MarkerOptions(
        position: LatLng(
          doc.data["location"].latitude,
          doc.data["location"].longitude,
        ),
        icon: BitmapDescriptor.fromAsset("assets/point.png"),
        infoWindowText: InfoWindowText(doc.data["nome"], '...'),
      ));
    });
  }
}
