import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../utils1.dart';

class TableEventsExample extends StatefulWidget {
  @override
  _TableEventsExampleState createState() => _TableEventsExampleState();
}

class _TableEventsExampleState extends State<TableEventsExample> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime(
    2021,
    03,
    01,
  );
  DateTime _rangeStart = DateTime(
    2021,
    03,
    01,
  );
  DateTime _rangeEnd = DateTime(
    2021,
    03,
    01,
  );
  ValueNotifier<List<Slot>> _selectedEvents = ValueNotifier([Slot("", "", "")]);

  @override
  void initState() {
    super.initState();
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay));

    _selectedDay = _focusedDay;
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Slot> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

/*
  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }
*/
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    //if (!isSameDay(_selectedDay, selectedDay)) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
      _rangeSelectionMode = RangeSelectionMode.toggledOff;
    });

    _selectedEvents.value = _getEventsForDay(selectedDay);
    //}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TableCalendar - Events'),
      ),
      body: Column(
        children: [
          TableCalendar<Slot>(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            calendarStyle: CalendarStyle(
              todayTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                  color: Colors.white),
              outsideDaysVisible: false,
            ),

            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            eventLoader: _getEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.monday,
            /*
            calendarBuilders: CalendarBuilders(
              disabledBuilder: (context, date, events) => Container(
                  margin: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(color: Colors.white),
                  )),
            ),*/
            onDaySelected: _onDaySelected,
            //onRangeSelected: _onRangeSelected,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ValueListenableBuilder<List<Slot>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      // Design slots
                      child: ListTile(
                        selectedTileColor: Colors.limeAccent,
                        onTap: () => print('${value[index]}'),
                        title: Row(children: <Widget>[
                          Icon(Icons.wb_sunny_rounded),
                          Text('${value[index]}'),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                DateFormat('yyyy-MM-dd').format(_selectedDay),
                                style: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.red,
                                  decorationStyle: TextDecorationStyle.wavy,
                                ),
                              ))
                        ]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
