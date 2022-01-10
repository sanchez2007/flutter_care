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
      //mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          children: [
            Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.search_off_rounded),
                    Text(
                      "Search by Doc Name",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                MyAppDropdwn("Search by Doc Name", Setcheckdata),
                TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.teal,
                      shadowColor: Colors.white38,
                      elevation: 10,
                      side: BorderSide(color: Colors.blueGrey, width: 2),
                      shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
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

                //Searchcardview("Search by Doc Name", "Enter Doctor name"),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(Icons.search_off_rounded),
                    Text(
                      "Search by Clinic Name",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                MyAppDropdwn("Search by clinic Name", Setcheckdata),
                //Searchcardview("Search by Speciality Name", "Enter Speciality Name"),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(Icons.search_off_rounded),
                    Text(
                      "Search by Speciality Name",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                MyAppDropdwn("Search by Sepciality ", Setcheckdata),
                //Searchcardview("Search by Speciality", "Enter Speciality"),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
