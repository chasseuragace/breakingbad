import 'package:flutter/material.dart';
import 'package:tutor/main.dart';

class FavouritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Favourites')),
        body: Column(
          children: [
            Text('My favourite Characters'),
            Expanded(
                child: ListView.builder(
                    itemCount: database.getFavourites().length,
                    itemBuilder: (BuildContext context, int index) =>
                        Text('$index')))
          ],
        ));
  }
}
