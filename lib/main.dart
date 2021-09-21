import 'package:first_app/result.dart';
import 'package:flutter/material.dart';
import './quiz.dart';
import './questions.dart';
import './result.dart';

class Myapp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyappState();
  }
}

class MyappState extends State {
  var _i = 0;
  void myanswer() {
    var myans1 = "Ans1";
    setState(() {
      _i = _i + 1;
    });
    if (_i < a_qa_maps.length) {
      print("My Answer is " + _i.toString());
    } else {
      print("My Answer is still  " + _i.toString());
    }
  }

  final a_qa_maps = [
    {
      "Questions": "what is your name ",
      "Ans": ["sanche", "Mache", "tests"]
    },
    {
      "Questions": "what is your age ",
      "Ans": ["30", "40", "50"]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Bartexts("Questioneer"),
        ),
        body: _i < a_qa_maps.length
            ? Column(
                children: [
                  Bartexts('press button for a new question '),
                  Quiz(
                      answerQues: myanswer,
                      questions: a_qa_maps,
                      questindex: _i)
                ],
              )
            : Result(),
      ),
    );
  }
}

//Void main has only one function and so its equated as =>
void main() => runApp(Myapp());
