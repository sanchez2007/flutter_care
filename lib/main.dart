import 'package:flutter/material.dart';
import 'Screens/home/tab_screen.dart';
import 'Screens/profile/profile_screen.dart';
import 'Screens/UserAccount/UserProfile.dart';
import 'Screens/Logon/auth_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Care Patient App',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          primaryColor: Colors.purple,
          accentColor: Colors.amber,
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                      headline6: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                  )))

          //textTheme:const TextTheme(bodyText2: TextStyle(color: Colors.purple)),
          ),
      //This is Home screen
      //home: MyHomePage(),
      initialRoute: '/',
      routes: {
        //  '/': (ctx) => TabsScreen(),
        '/': (ctx) => AuthScreen(),
        '/profile': (ctx) => ProfileScreen(
            profilename: "XXXXX", email: "xxxx@hh.com", Phoneno: "2222222"),
        '/bankdetails': (ctx) => BankingDetails(),
      },
    );
  }
}
