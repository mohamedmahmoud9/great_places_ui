import 'package:flutter/material.dart';
import '../models/place.dart';
import '../screens/place_detail_screen.dart';

class PlaceItem extends StatelessWidget {
  final Place place;
  PlaceItem(this.place);
  @override
  Widget build(BuildContext context) {
    // final place = Provider.of<Place>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(PlaceDetailScreen.routeName,arguments: place.id);
          },
          child: Image.file(
            place.image,
            fit: BoxFit.cover,
          ),
        ),
        footer: Container(
          height: 50,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black87, Colors.transparent])),
          child: FittedBox(
            child: Text(
              place.title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                   fontSize: 50,
                  color: Colors.white),
            ),
          ),
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 15),
        ),
      ),
    );
  }
}
