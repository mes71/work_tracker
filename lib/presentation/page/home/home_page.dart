import 'package:flutter/material.dart';
import 'package:jalali_table_calendar_plus/jalali_table_calendar_plus.dart';
import 'package:work_tracker/presentation/widgets/half_progress.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            HalfCircleProgressBar(
              width: 350,
              height: 200,
              progress: 0.6,
            ),
            Positioned(
                right: 0,
                bottom: 0,
                left: 0,
                child: Text(
                  '194 hours',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ))
          ],
        ),
        SizedBox(height: 20),
        Card(
          elevation: 5,
          margin: const EdgeInsets.all(20),
          child: buildCalendar(context),
        )
      ],
    );
  }
}

Widget buildCalendar(BuildContext context) {
  return JalaliTableCalendar(
      events: {
        DateTime.now(): ['sample event', 26],
        DateTime.now().add(const Duration(days: 1)): [
          'all types can use here',
          {"key": "value"}
        ],
      },
      marker: (date, events) {
        if (events.isNotEmpty) {
          return Positioned(
            left: 0,
            top: -3,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue[200], shape: BoxShape.circle),
              padding: const EdgeInsets.all(6.0),
              child: Center(
                child: Text((events.length).toString()),
              ),
            ),
          );
        }
        return null;
      },
      onDaySelected: (DateTime selectDate) {
        print(selectDate);
      });
}
