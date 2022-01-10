import 'package:flutter/material.dart';
import '../home/searchcard.dart';

class BookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Select the Doctor'),
          //iconTheme: ,
        ),
        body: Searchcards());
  }
}
