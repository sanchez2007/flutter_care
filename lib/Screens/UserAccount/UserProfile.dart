import 'package:flutter/material.dart';

class BankingDetails extends StatelessWidget {
  void selectprofilepage(BuildContext bld) {}

  @override
  Widget build(BuildContext context) {
    // Navigator.of(context).pushNamed('/profile');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Account data",
        ),
      ),
      body: Center(
        child: Text("Account data"),
      ),
    );
  }
}
