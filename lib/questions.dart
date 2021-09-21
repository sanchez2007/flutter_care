import 'package:flutter/material.dart';

class Bartexts extends StatelessWidget {
  final String _barstring;
  Bartexts(this._barstring);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        _barstring,
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class Questions extends StatelessWidget {
  final String questionhandler;
  Questions(this.questionhandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.yellow,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.orange),
        ),
        child: Text(questionhandler),
        onPressed: null,
      ),
    );
  }
}
