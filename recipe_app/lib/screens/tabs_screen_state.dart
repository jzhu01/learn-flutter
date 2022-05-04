import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favorites_screen.dart';

class TabsScreenState extends StatefulWidget {
  @override
  _TabsScreenStateState createState() => _TabsScreenStateState();
}

class _TabsScreenStateState extends State<TabsScreenState> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.category), text: "Categories"),
              Tab(icon: Icon(Icons.star), text: "Favorites"),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CategoriesScreen(),
            FavoritesScreen(),
          ]
        ),
      ),
    );
  }
}
