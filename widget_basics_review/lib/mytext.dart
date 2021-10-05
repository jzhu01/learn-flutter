import 'package:flutter/cupertino.dart';

class MyText extends StatelessWidget{
  final String appBarText1;
  final String appBarText2;
  final bool toggledText;

  MyText(this.appBarText1, this.appBarText2, this.toggledText);

  @override
  Widget build(BuildContext context) {
    return toggledText ? Text(appBarText1) : Text(appBarText2);
  }

}