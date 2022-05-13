import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.w700),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).accentColor,
          child: Text("Cooking up",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.white,
              )),
        ),
        SizedBox(height: 20),
        buildListTile(
          'Meals',
          Icons.restaurant,
          () {
            return Navigator.pushReplacementNamed(context, '/');
          },
        ),
        buildListTile(
          'Filters',
          Icons.settings,
          () {
            return Navigator.pushReplacementNamed(context, FiltersScreen.routeName);
          },
        ),
      ]),
    );
  }
}
