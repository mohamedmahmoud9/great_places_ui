

import 'package:flutter/material.dart';
// import 'package:location/location.dart';
import 'package:map_view/map_view.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  Uri _staticMapUri;
 
  void getStaticMap() {
    final StaticMapProvider staticMapViewProvider =
        StaticMapProvider('AIzaSyAIwX67ML4KtIzYXs20mvj5B3Xuaz8GmEY');
    final Uri uri = staticMapViewProvider.getStaticUriWithMarkers(
      [Marker('postion', 'postion', 31.3615135, 31.2132152)],
      width: 200,
      height: 170,
      maptype: StaticMapViewType.roadmap
    );
    setState(() {
      _staticMapUri =uri;
    });
  }
  @override
  void initState() {
    getStaticMap();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          height: 170,
          alignment: Alignment.center,
          width: double.infinity,
          child:
             Image.network(
                  _staticMapUri.toString(),
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FlatButton.icon(
                onPressed: () {}, //_getCurrentLocation,
                icon: Icon(Icons.location_on),
                label: Text('Current Location')),
            FlatButton.icon(
                onPressed: () {},
                icon: Icon(Icons.map),
                label: Text('Select on Map'))
          ],
        )
      ],
    );
  }
}
