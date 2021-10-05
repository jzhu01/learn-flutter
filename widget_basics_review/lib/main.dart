// 1) Create a new Flutter App (in this project) and output an AppBar and some text
// below it
// 2) Add a button which changes the text (to any other text of your choice)
// 3) Split the app into three widgets: App, TextControl & Text
import 'package:flutter/cupertino.dart';

import './textcontrol.dart';
import './mytext.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final String _appBarText1 = "Woot Woot for Dart!";
  final String _appBarText2 = "Woot Woot for Flutter!";
  bool _toggledText = false;

  void modifyAppBarText() {
    setState(() {
      _toggledText = !_toggledText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        home: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: MyText(_appBarText1, _appBarText2, _toggledText),
          ),
          child: ListView(
              children: <Widget>[
                TextControl(modifyAppBarText),
              ]
          ),
        );
    );
  }
}
