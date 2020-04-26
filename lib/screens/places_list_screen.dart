import 'package:flutter/material.dart';
import '../screens/add_place_screen.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import '../widgets/place_item.dart';
import '../providers/great_places.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final placesData = Provider.of<GreatPlaces>(context).items;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Great Places",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.add),
                color: Colors.black,
                onPressed: () {
                  Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
                })
          ],
        ),
        body: FutureBuilder(
          future: Provider.of<GreatPlaces>(context, listen: false)
              .fetchAndSetPlaces(),
          builder: (ctx, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Consumer<GreatPlaces>(
                  child: Center(child:Text('Add some places!')),
                  builder: (ctx, place, ch) =>place.items.length<=0? ch:StaggeredGridView.countBuilder(
                    padding: EdgeInsets.all(15),
                    crossAxisCount: 2,
                    itemCount: place.items.length,
                    itemBuilder: (BuildContext context, int index) =>
                        PlaceItem(place.items[index]),
                    staggeredTileBuilder: (int index) =>
                        new StaggeredTile.count(index % 3 == 0 ? 2 : 1, 1),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                ),
        ));
  }
}
