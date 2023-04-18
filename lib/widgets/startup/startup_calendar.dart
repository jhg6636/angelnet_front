import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';

class StartupCalendar extends StatelessWidget {
  const StartupCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime firstDay = DateTime(now.year, now.month, 1);
    DateTime lastDay = DateTime(2099, 12, 31);
    return TableCalendar(
      focusedDay: now,
      firstDay: firstDay,
      lastDay: lastDay,
      onFormatChanged: (format) {},
      locale: 'ko_KR',
    );
  }
}
