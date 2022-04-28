import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;

  CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('categoryTitle'),
      ),
      body: Center(
        child: Text("Recipes for the Category Go here!"),
      ),
    );
  }
}
