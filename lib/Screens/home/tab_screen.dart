import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Screens/home/maim_drawer.dart';
import '../profile/profile_screen.dart';
import '../doctor_booking/booking_screen.dart';
import '../booking_history/history_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Welcome XXX'),
            bottom: TabBar(
              indicatorColor: Colors.amberAccent,
              indicatorWeight: 2.0,
              // labelColor: Colors.white12,
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.medical_services_rounded),
                  text: "Book a Doc",
                ),
                Tab(
                  icon: Icon(Icons.list_alt_rounded),
                  text: "OldBookings",
                ),
              ],
            ),
          ),
          drawer: Maindrawer(),
          body: TabBarView(children: <Widget>[
            BookingScreen(),
            HistoryScreen("My History", Colors.white70),
          ])),
    );
  }
}
