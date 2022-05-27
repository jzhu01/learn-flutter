import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widget/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> _favoritedMeals;

  FavoritesScreen(this._favoritedMeals);

  @override
  Widget build(BuildContext context) {
    if (_favoritedMeals.isEmpty) {
      return Center(child: Text("You Have No Favorites Yet - Start Adding Some!"));
    } else {
      return ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: _favoritedMeals[index].id,
                title: _favoritedMeals[index].title,
                imageUrl: _favoritedMeals[index].imageUrl,
                duration: _favoritedMeals[index].duration,
                complexity: _favoritedMeals[index].complexity,
                affordability: _favoritedMeals[index].affordability,
            );
          },
          itemCount: _favoritedMeals.length);
    }
  }
}
