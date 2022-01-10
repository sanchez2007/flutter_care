import 'dart:collection';
import 'package:table_calendar/table_calendar.dart';

/// Example Slot class.
class Slot {
  String title;

  Slot(this.title);

  @override
  String toString() => title;
}

/// Example Slots.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Slot>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
    key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item),
    value: (item) =>
        List.generate(2, (index) => Slot('Slot $item | ${index + 1}')))
  ..addAll({
    kToday: [
      Slot('Avaialable 6pm- 9pm'),
      Slot('Avaialable 6pm- 9pm'),
      Slot(''),
    ],
  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 2, kToday.day);
