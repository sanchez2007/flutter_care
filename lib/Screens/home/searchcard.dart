import 'package:flutter/material.dart';
import './drop_downlist.dart';
import '../doctor_booking/doct_selection/select_doctor_clinic.dart';

class Searchcards extends StatelessWidget {
  String checkdata;

  void Setcheckdata(String var2) {
    this.checkdata = var2;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          children: [
            Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search_rounded),
                    Text(
                      "Search by Doc Name",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                MyAppDropdwn("Search by Doc Name", Setcheckdata),
                ElevatedButton(
                    child: Text('check Availability'),
                    onPressed: () {
                      if (this.checkdata != null) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DoctorSelectionScreen(
                                  this.checkdata,
                                  Colors.blue.shade100,
                                )));
                      }
                    }),

                //Searchcardview("Search by Speciality", "Enter Speciality"),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
