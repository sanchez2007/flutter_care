import 'package:flutter/material.dart';
import '../../../dummy_data.dart';
import './doctor_clinic_items.dart';

class DoctorSelectionScreen extends StatelessWidget {
  final String title;
  final Color color;

  DoctorSelectionScreen(this.title, this.color);

  void selecthistory() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: InkWell(
        onTap: selecthistory,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 4,
          margin: EdgeInsets.all(5),
          child: ListView(
            padding: const EdgeInsets.all(25),
            children: DUMMY_CATEGORIES
                .map(
                  (catData) => DoctorClinicScreenItems(
                    catData.id,
                    catData.title,
                    catData.color,
                  ),
                )
                .toList(),
          ),
        ),
        /*
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),*/
      ),
    );
  }
}
