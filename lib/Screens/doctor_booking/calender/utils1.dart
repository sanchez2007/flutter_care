import 'dart:collection';
import 'package:table_calendar/table_calendar.dart';

import 'package:intl/intl.dart';

class Slot {
  String title;
  String color;
  String ampm;
  Slot(this.title, this.color, this.ampm);

  @override
  String toString() {
    return 'Slot (${this.title} ${this.color} ${this.ampm})';
  }
}

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/*
bool isSameDay(DateTime dateA, DateTime dateB) {
  return dateA?.year == dateB?.year &&
      dateA?.month == dateB?.month &&
      dateA?.day == dateB?.day;
}
*/
LinkedHashMap<DateTime, List<Slot>> feed_data() {
  //Dummy Data creation
  var DummyDaySlotMap = Map();
  var temp = Map();
  temp["AM"] = 34;
  temp["PM"] = 54;

  var dateTime1 = DateFormat('d-M-yyyy').parse("17-02-2022");
  DummyDaySlotMap[dateTime1] = temp;
  var temp1 = Map();
  temp1["AM"] = 42;
  temp1["PM"] = 33;

  var dateTime2 = DateFormat('d-M-yyyy').parse("18-02-2022");
  DummyDaySlotMap[dateTime2] = temp1;

  // DummyDaySlotMap.forEach((k, v) => print("Key : $k, Value : $v"));
  // print(_kEventSource);
  // Dummy data created
  final FinalSlot = new LinkedHashMap<DateTime, List<Slot>>();
  var NewSlotdata = Map.fromEntries(DummyDaySlotMap.entries);
  // print(NewSlotdata);

  for (MapEntry e in NewSlotdata.entries) {
    List<Slot> DaySlotList = [];

    //  for ( MapEntry y in e.value){
    e.value.forEach(
        (k, v) => DaySlotList.add(Slot('$k', e.value[k].toString(), 'color')));
    //value.forEach((k, v) =>  print(e.value[k]));
    //DaySlotList.add(Slot(y.key,));

    //}

    //e.value.forEach((k, v) => DaySlotList.add(Slot(k,v,));
    //print(DaySlotList);
    FinalSlot[e.key] = DaySlotList;
  }

  print(FinalSlot);
  return FinalSlot;
}

var kToday = DateTime.now();
var kFirstDay = DateTime(kToday.year, kToday.month, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 2, kToday.day);
final data = feed_data();
final kEvents = LinkedHashMap<DateTime, List<Slot>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(data);
