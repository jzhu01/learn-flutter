import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-details';

  // final String id;

  // MealDetailsScreen({@required this.id});

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('The Meal: $mealId'),
      ),
      body: Center(
          child: Text(
        'The meal - $mealId!',
      )),
    );
  }
}
