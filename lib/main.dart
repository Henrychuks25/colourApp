import 'package:colour_app/question.dart';
import 'package:colour_app/quiz.dart';
import 'package:colour_app/result.dart';
import 'package:flutter/material.dart';
import 'package:colour_app/answer.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final _questions = const [
    {
      'questionText': 'What\'s your favourite colour?',

      'answers':[
      {'Text': 'Black', 'Score':5},
      {'Text': 'Red', 'Score':4},
      {'Text': 'Green', 'Score':3},
      {'Text': 'White', 'Score':2},
      ],
     },
    {
      'questionText': 'What\'s favourite animal?',
      'answers':
      [
        {'Text': 'Rabbit', 'Score':5},
        {'Text': 'Lion', 'Score':4},
        {'Text': 'Elephant', 'Score':3},
        {'Text': 'Goat', 'Score':2},
      ],
    },
    {
      'questionText': 'Who\'s your favourite teacher?',
      'answers':
      [
        {'Text': 'Henry', 'Score':15},
        {'Text': 'James', 'Score':14},
        {'Text': 'Phil', 'Score':1},
      ],
    },

  ];
  var _questionIndex = 0;
  var _totalScore = 0;
  void _answerQuestions(int score){
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;

    });
    print(_questionIndex);
    if(_questionIndex < _questions.length){
      print('End of question reached');
    }else{
      print('Invalid number');
    }
  }
  void _resetQuiz(){
    setState(() {
       _questionIndex = 0;
       _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return   MaterialApp(home: Scaffold(
      appBar: AppBar(title: Text('My Simple App'),),
      body: _questionIndex < _questions.length ? Quiz(questions: _questions, answeredQuestions: _answerQuestions, questionIndex: _questionIndex,)
          : Result(_totalScore, _resetQuiz),
    ),);
  }
}