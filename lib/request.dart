import 'package:flutter/material.dart';
class _ExamplePageState extends State<ExamplePage> {
  // controls the text label we use as a search bar
  final TextEditingController _filter = new TextEditingController();
  final dio = new Dio(); // for http requests
  String _searchText = "";
  List names = new List(); // names we get from API
  List filteredNames = new List(); // names filtered by search text
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text( 'Search Example' );
}


void _getNames() async {
  final response = await dio.get('https://swapi.co/api/people');
  List tempList = new List();
  for (int i = 0; i < response.data['results'].length; i++) {
    tempList.add(response.data['results'][i]);
  }

  setState(() {
    names = tempList;
    filteredNames = names;
  });
}