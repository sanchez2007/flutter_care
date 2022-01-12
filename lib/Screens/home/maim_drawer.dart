import 'package:flutter/material.dart';

class Maindrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function taphandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 20,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: taphandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Listings ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile("Account", Icons.face_retouching_natural, () {
            Navigator.of(context).pushNamed('/profile');
          }),
          buildListTile("My Bookings", Icons.list_alt_outlined, () {
            Navigator.of(context).pushNamed('/bankdetails');
          }),
          buildListTile("Payments", Icons.money_sharp, () {
            Navigator.of(context).pushNamed('/profile');
          }),
        ],
      ),
    );
  }
}
