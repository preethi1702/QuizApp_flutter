import './quiz.dart';
import 'package:flutter/material.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State {
  final _questions = const [
    {
      'questionText': 'what\'s your favourite color',
      'answers': [
        {'text': 'Pink', 'score': 2},
        {'text': 'SkyBlue', 'score': 4},
        {'text': 'White', 'score': 6},
        {'text': 'Black', 'score': 8},
      ]
    },
    {
      'questionText': 'who\'s your inspiration',
      'answers': [
        {'text': 'Parents', 'score': 2},
        {'text': 'Friends', 'score': 4},
        {'text': 'Teachers', 'score': 6},
        {'text': 'Self_motivation', 'score': 8},
      ]
    },
    {
      'questionText': 'what\'s your life ambition',
      'answers': [
        {'text': 'Doctor', 'score': 2},
        {'text': 'Lawyer', 'score': 4},
        {'text': 'Teacher', 'score': 6},
        {'text': 'Police', 'score': 8},
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalscore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalscore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalscore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('First App'),
            ),
            body: _questionIndex < _questions.length
                ? Quiz(
                    questions: _questions,
                    answerQuestion: _answerQuestion,
                    questionIndex: _questionIndex)
                : Result(_totalscore, _resetQuiz)));
  }
}
