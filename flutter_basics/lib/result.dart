import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;

  Result(this.resultScore, this.resetQuiz);

  String get resultText {
    var resultPhrase = "You did it!";
    if (resultScore <= 8) {
      resultPhrase = "Interesting person you are!";
    } else if (resultScore <= 12) {
      resultPhrase = "Pretty cool answers!";
    } else if (resultScore <= 16) {
      resultPhrase = "Funny, we're so similar!";
    } else {
      resultPhrase = "Strange one!";
    }
    return resultPhrase;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultText,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          FlatButton(
            child: Text('Restart Quiz',
                style: TextStyle(
                  color: Colors.blue,
                )),
            onPressed: resetQuiz,
          )
        ],
      ),
    );
  }
}
