import 'package:colour_app/Question.dart';
import 'package:flutter/material.dart';
import 'package:colour_app/Answer.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final questions = const [
    {
      'questionText': 'What\'s your favourite colour?',
      'answers': ['Black', 'Red', 'Green', 'White' ],
    },
    {
      'questionText': 'What\'s favourite animal?',
      'answers': ['Rabbit', 'Lion', 'Elephant', 'Goat' ],
    },
    {
      'questionText': 'Who\'s your favourite teacher?',
      'answers': ['Henry', 'James', 'Phil'],
    },

  ];
  var _questionIndex = 0;
  void _answerQuestions(){
    setState(() {
      _questionIndex = _questionIndex + 1;

    });
    print(_questionIndex);
    if(_questionIndex < questions.length){
      print('End of question reached');
    }else{
      print('Invalid number');
    }


  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return   MaterialApp(home: Scaffold(
      appBar: AppBar(title: Text('My Simple App'),),
      body: _questionIndex < questions.length ? Column(
        children: [
          Question(
            questions[_questionIndex]['questionText'] as String,
          ),
         ...(questions[_questionIndex]['answers'] as List<String>)
          .map((answer){
            return Answer(_answerQuestions, answer);
         }).toList()
          ],
         ) : Center(
        child:
        Text('You have no more question!'),),
    ),);
  }
}