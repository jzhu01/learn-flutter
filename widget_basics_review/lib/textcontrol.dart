import 'package:flutter/cupertino.dart';

class TextControl extends StatelessWidget {
  final VoidCallback modifyAppBarText;

  TextControl(this.modifyAppBarText);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Text('Click to change the Nav Text'),
      onPressed: modifyAppBarText,
    );
  }

}