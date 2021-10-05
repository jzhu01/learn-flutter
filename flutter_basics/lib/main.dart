import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "What\'s your favorite color?",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "White", "score": 9},
        {"text": "Red", "score": 5},
        {"text": "Blue", "score": 2}
      ]
    },
    {
      "questionText": "What\'s your favorite animal?",
      "answers": [
        {"text": "Giraffe", "score": 10},
        {"text": "Polar Bear", "score": 3},
        {"text": "Hare", "score": 5},
        {"text": "Otter", "score": 1}
      ]
    },
    {
      "questionText": "Who\'s your favorite star?",
      "answers": [
        {"text": "Drake", "score": 2},
        {"text": "Beyonce", "score": 9},
        {"text": "Justin Bieber", "score": 5},
        {"text": "Taylor Swift", "score": 7}
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("We have more questions!");
    }
  }

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
