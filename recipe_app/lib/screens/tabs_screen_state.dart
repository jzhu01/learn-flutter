import 'package:flutter/material.dart';

import '../models/meal.dart';
import './categories_screen.dart';
import './favorites_screen.dart';
import '../widget/main_drawer.dart';

class TabsScreenState extends StatefulWidget {
  final List<Meal> favoritedMeals;

  TabsScreenState(this.favoritedMeals);

  @override
  _TabsScreenStateState createState() => _TabsScreenStateState();
}

class _TabsScreenStateState extends State<TabsScreenState> {
  List<Map<String, Object>> _pages;

  @override
  initState() {
    this._pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoritesScreen(widget.favoritedMeals), 'title': 'Your Favorites'},
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.white,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: 'Favorites',
            )
          ]),
    );
  }
}
