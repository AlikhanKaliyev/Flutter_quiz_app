import 'package:flutter/material.dart';

import './question.dart';

import './answer.dart';

import './quiz.dart';

import './result.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
      {
        'questionText': 'What\'s your favourite color?',
        'answers':[
          {
           'text': 'Black',
           'score': 10
          },
          {
           'text': 'Red',
           'score': 5
          },
          {
           'text': 'Green',
           'score': 3
          },
          {
           'text': 'White',
           'score': 1
          }
        ]
      },
      {
        'questionText': 'What\'s your favourite animal?',
        'answers':[
          {
           'text': 'Rabbit',
           'score': 10 
          },
          {
           'text': 'Snake',
           'score': 5 
          },
          {
           'text': 'Elephant',
           'score': 3 
          },
          {
           'text': 'Lion',
           'score': 1 
          }
        ]
      },
      {
        'questionText': 'Who\'s your favourite instructor?',
        'answers':[
          {
           'text': 'Max',
           'score': 1 
          },
          {
           'text': 'Max',
           'score': 1 
          },
          {
           'text': 'Max',
           'score': 1 
          },
          {
           'text': 'Max',
           'score': 1 
          }
        ]
      },
    ];
  void _answerQuestion (int score) {
    _totalScore += score;
    if(_questionIndex < _questions.length) {
      setState(() {
        _questionIndex += 1;   
      });
    }
  }
  void _resetQuiz () {
    setState(() {
    _totalScore = 0;
    _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length 
        ?  Quiz(answerQuestion: _answerQuestion, questions: _questions, questionIndex: _questionIndex)
        : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
