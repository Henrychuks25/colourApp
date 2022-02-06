import 'package:flutter/material.dart';
class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;
  Result(this.resultScore, this.resetHandler);

  String get ResultPhrase{
    var resultText = 'You are great';
    if(resultScore <= 5){
      resultText = 'This is poor';
    }
    else if(resultScore <= 10){
      resultText = 'This is above average';
    }
    else if(resultScore<= 30){
      resultText = 'You Rock!';
    }
    else{
      resultText = 'You are so out of way';
    }
    return resultText;
  }
  @override
  Widget build(BuildContext context) {

    return Center(
      child:
      Column(
        children: [
          Text(ResultPhrase, style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          TextButton(onPressed: resetHandler, child: Text("Restart Choices"),
          style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.blue)),)
        ],
      ),
    );
  }
}
