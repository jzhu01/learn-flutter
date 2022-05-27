import 'package:flutter/material.dart';

import '../widget/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Map<String, bool> currFilters;
  final Function saveFilters;

  FiltersScreen(this.currFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currFilters['gluten'];
    _vegetarian = widget.currFilters['vegetarian'];
    _vegan = widget.currFilters['vegan'];
    _lactoseFree = widget.currFilters['lactose'];
    super.initState();
  }
  Widget _buildFilterSwitch(
      String title, String description, bool currValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currValue,
      subtitle: Text('Only include $description meals'),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save), onPressed: () {
            final selectedFilters = {
              'gluten': _glutenFree,
              'vegetarian': _vegetarian,
              'vegan': _vegan,
              'lactose': _lactoseFree
            };
            widget.saveFilters(selectedFilters);
          }),
        ]
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your Meal Selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildFilterSwitch(
                  "Gluten-Free",
                  "gluten-free",
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                _buildFilterSwitch(
                  "Vegetarian",
                  "vegetarian",
                  _vegetarian,
                      (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                _buildFilterSwitch(
                  "Vegan",
                  "vegan",
                  _vegan,
                      (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                _buildFilterSwitch(
                  "Lactose-Free",
                  "lactose-free",
                  _lactoseFree,
                      (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
