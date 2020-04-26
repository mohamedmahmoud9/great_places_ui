import 'package:flutter/material.dart';
import '../providers/great_places.dart';
import 'package:provider/provider.dart';
class PlaceDetailScreen extends StatelessWidget {
  static const routeName = '/place-detail';
  
  @override
  Widget build(BuildContext context) {
    final placeId =  ModalRoute.of(context).settings.arguments;
    final loadedPlace = Provider.of<GreatPlaces>(context).findById(placeId);
    return Scaffold(
      body: Center(child:Image.file(loadedPlace.image,fit:BoxFit.scaleDown)),
    );
  }
}