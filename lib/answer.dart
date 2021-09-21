import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final Function answerhandler;
  final String Answertext;
  Answers(this.answerhandler, this.Answertext);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        ),
        child: Text(Answertext),
        onPressed: answerhandler,
      ),
    );
  }
}
