import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/product.dart';
import 'package:provider/provider.dart';

import '../models/products.dart';
import '../widgets/products_grid.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.more_vert,),
              onSelected: (FilterOptions selected) {
                setState(() {
                  if (selected == FilterOptions.Favorites) {
                    // reduce amount of items
                    _showOnlyFavorites = true;
                  } else {
                    // show all
                    _showOnlyFavorites = false;
                  }
                });
              },
              itemBuilder: (_) => [
                PopupMenuItem(child: Text('Only Favorites'), value: FilterOptions.Favorites),
                PopupMenuItem(child: Text('Show All'), value: FilterOptions.All),
              ])
        ],
      ),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
