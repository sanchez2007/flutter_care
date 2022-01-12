import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class MyAppDropdwn extends StatefulWidget {
  String Searchdefaulttext;
  Function addTx;

  MyAppDropdwn(Searchdefaulttext, func) {
    this.Searchdefaulttext = Searchdefaulttext;
    this.addTx = func;
  }

  @override
  _MyAppState createState() => _MyAppState(this.addTx);
}

class _MyAppState extends State<MyAppDropdwn> {
  Function addTx1;

  bool asTabs = false;

  String selectedValue = "xyx";
  String preselectedValue = "dolor sit";

  _MyAppState(func) {
    this.addTx1 = func;
  }

  final List<DropdownMenuItem> items = [];

  final String loremIpsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  @override
  void initState() {
    String wordPair = "";
    loremIpsum
        .toLowerCase()
        .replaceAll(",", "")
        .replaceAll(".", "")
        .split(" ")
        .forEach((word) {
      if (wordPair.isEmpty) {
        wordPair = word + " ";
      } else {
        wordPair += word;
        if (items.indexWhere((item) {
              return (item.value == wordPair);
            }) ==
            -1) {
          items.add(DropdownMenuItem(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    wordPair,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(wordPair + "rt"),
                  Text(
                    "DENTAL",
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                ]),
            value: wordPair,
          ));
        }
        wordPair = "";
      }
    });
    super.initState();
  }

  List<Widget> get appBarActions {
    return ([
      Center(child: Text("Tabs:")),
      Switch(
        activeColor: Colors.white,
        value: asTabs,
        onChanged: (value) {
          setState(() {
            asTabs = value;
          });
        },
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white38,
        borderRadius: BorderRadius.circular(4),
      ),
      child: SearchableDropdown.single(
        items: items,
        value: selectedValue,
        hint: "Select one",
        searchHint: "Select one",
        onChanged: (value) {
          setState(() {
            print('The value from dropdown is: $value');
            selectedValue = value;
            addTx1(value);
          });
        },
        isExpanded: true,
      ),
    );
  }
}
