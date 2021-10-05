import 'package:flutter/cupertino.dart';

class TextControl extends StatelessWidget {
  final VoidCallback modifyAppBarText;

  const TextControl(this.modifyAppBarText);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: const Text('Click to change the Nav Text'),
      onPressed: modifyAppBarText,
    );
  }
}