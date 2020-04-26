import 'package:map_view/map_view.dart';

import 'package:flutter/material.dart';
import './screens/places_list_screen.dart';
import 'package:provider/provider.dart';
import './providers/great_places.dart';
import './screens/place_detail_screen.dart';
import './screens/add_place_screen.dart';

void main() {
 
  runApp(MyApp()); 
   MapView.setApiKey('AIzaSyAIwX67ML4KtIzYXs20mvj5B3Xuaz8GmEY');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
      primarySwatch: Colors.red,
        ),
        home: PlacesListScreen(),
        routes: {
          AddPlaceScreen.routeName:(ctx)=>AddPlaceScreen(),
          PlaceDetailScreen.routeName:(ctx)=>PlaceDetailScreen()
        },
      ),
    );
  }
}
