import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Screens/home/maim_drawer.dart';
import '../doctor_booking/booking_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.face_retouching_natural),
              Text(
                "Welcome xxxx",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          bottom: TabBar(
            indicatorColor: Colors.amberAccent,
            indicatorWeight: 1.0,
            // labelColor: Colors.white12,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.medical_services_rounded),
                text: "Book a Doc",
              ),
            ],
          ),
        ),
        drawer: Maindrawer(),
        body: TabBarView(children: <Widget>[
          BookingScreen(),
          //HistoryScreen("My History", Colors.white70),
        ]),
        bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  tooltip: "Go to Contact page",
                  icon: Icon(Icons.mail),
                  label: 'Contact Us ',
                  backgroundColor: Colors.deepPurple),
              BottomNavigationBarItem(
                  tooltip: "Go to About page",
                  icon: Icon(Icons.info),
                  label: 'About Us ',
                  backgroundColor: Colors.deepPurple),
            ],
            type: BottomNavigationBarType.shifting,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.black,
            iconSize: 40,
            onTap: _onItemTapped,
            elevation: 5),
      ),
    );
  }
}
