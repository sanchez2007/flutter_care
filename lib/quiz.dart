import 'package:flutter/material.dart';
import './questions.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQues;
  final int questindex;
  Quiz({
    @required this.answerQues,
    @required this.questions,
    @required this.questindex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Questions(questions[questindex]["Questions"]),
      ...(questions[questindex]["Ans"] as List<String>).map((answerlist) {
        return Answers(answerQues, answerlist);
      }).toList(),
    ]);
  }
}
