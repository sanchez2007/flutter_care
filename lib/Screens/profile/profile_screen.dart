import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String profilename;
  final String email;
  final String Phoneno;

  ProfileScreen(
      {@required this.profilename,
      @required this.email,
      @required this.Phoneno});

  void selectprofilepage(BuildContext bld) {}

  @override
  Widget build(BuildContext context) {
    // Navigator.of(context).pushNamed('/profile');

    return Scaffold(
        appBar: AppBar(
          title: Text(
            this.profilename,
          ),
        ),
        body: Stack(
          clipBehavior: Clip.hardEdge,
          children: <Widget>[
            Positioned(
              top: 0,
              right: 5,
              left: 5,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                  height: 250,
                  width: 250,
                ),
              ),
            ),
          ],
        ));
  }
}
