import 'package:flutter/material.dart';
import '../home/searchcard.dart';

class BookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_city),
              Text(
                "City",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          //iconTheme: ,
        ),
        body: Searchcards());
  }
}
