import 'package:flutter/material.dart';
import './doctor_slot_select.dart';

class DoctorClinicScreenItems extends StatelessWidget {
  final String Id;
  final String title;
  final Color color;

  DoctorClinicScreenItems(this.Id, this.title, this.color);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      child: Row(
        children: [
          Text(this.title),
          Text(this.Id),
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
                if (this.title != null) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DoctorSlotScreen()));
                }
              }),
        ],
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.4),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
