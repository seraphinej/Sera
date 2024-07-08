import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:swe2109772_assignment1/models/item_model.dart';
import 'package:swe2109772_assignment1/database/db_service.dart';

class FavoritePage extends StatefulWidget {
  final List<Item> favoriteItems;
  final Function(List<Item>) updateFavoriteItems;

  FavoritePage({required this.favoriteItems, required this.updateFavoriteItems});

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<Item> _favoriteItems = [];

  @override
  void initState() {
    super.initState();
    _favoriteItems = widget.favoriteItems;
  }

  Future<void> _removeFavorite(Item item) async {
    setState(() {
      widget.favoriteItems.remove(item);
    });
    await DatabaseService.deleteFavorite(item);
    widget.updateFavoriteItems(widget.favoriteItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Favorites',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: HexColor("#2596be"),
        centerTitle: true,
      ),
      body: _favoriteItems.isEmpty
          ? Center(
        child: Text(
          'Your favorite list is empty.',
          style: TextStyle(
            color: Colors.grey[800],
            fontSize: 25,
          ),
        ),
      )
          : ListView.builder(
        itemCount: _favoriteItems.length,
        itemBuilder: (context, index) {
          final item = _favoriteItems[index];
          return ListTile(
            leading: Image.asset(item.imgPath, width: 50, height: 50),
            title: Text(item.name),
            subtitle: Text(item.price),
            trailing: IconButton(
              icon: Icon(Icons.remove_circle, color: Colors.red),
              onPressed: () async {
                await _removeFavorite(item);
              },
            ),
          );
        },
      ),
    );
  }
}
