import 'package:flutter/material.dart';
import 'package:timelines_plus/timelines_plus.dart';

import '../../../utils/themes.dart';

// Model for a single class
class RoutineClass {
  final String time;
  final String courseName;
  final String courseCode;
  final String teacherName;

  RoutineClass({
    required this.time,
    required this.courseName,
    required this.courseCode,
    required this.teacherName,
  });
}

// Model for a day's routine
class DayRoutine {
  final String day;
  final List<RoutineClass> classes;

  DayRoutine({required this.day, required this.classes});
}

// Example routine data for 3 days
final List<DayRoutine> routineData = [
  DayRoutine(
    day: 'Mon',
    classes: [
      RoutineClass(
        time: '08:00 - 09:30',
        courseName: 'Mathematics',
        courseCode: 'MATH101',
        teacherName: 'Dr. Smith',
      ),
      RoutineClass(
        time: '10:00 - 11:30',
        courseName: 'Physics',
        courseCode: 'PHY101',
        teacherName: 'Prof. Johnson',
      ),
    ],
  ),
  DayRoutine(
    day: 'Wed',
    classes: [
      RoutineClass(
        time: '09:00 - 10:30',
        courseName: 'Chemistry',
        courseCode: 'CHEM101',
        teacherName: 'Dr. Lee',
      ),
      RoutineClass(
        time: '11:00 - 12:30',
        courseName: 'English',
        courseCode: 'ENG101',
        teacherName: 'Ms. Brown',
      ),
    ],
  ),
  DayRoutine(
    day: 'Thu',
    classes: [
      RoutineClass(
        time: '08:30 - 10:00',
        courseName: 'Computer Science',
        courseCode: 'CSE101',
        teacherName: 'Mr. White',
      ),
      RoutineClass(
        time: '10:30 - 12:00',
        courseName: 'Biology',
        courseCode: 'BIO101',
        teacherName: 'Dr. Green',
      ),
    ],
  ),
];

class RoutineScreen extends StatefulWidget {
  const RoutineScreen({super.key});

  @override
  State<RoutineScreen> createState() => _RoutineScreenState();
}

class _RoutineScreenState extends State<RoutineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Routine - 8th Semester',
          style: TextStyle(color: MyColors.white),
        ),
        backgroundColor: MyColors.background,
      ),
      body: ListView.builder(
        itemCount: routineData.length,
        itemBuilder: (context, dayIndex) {
          final dayRoutine = routineData[dayIndex];
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 16.0,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: MyColors.backgroundLight,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      dayRoutine.day,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    FixedTimeline.tileBuilder(
                      builder: TimelineTileBuilder.connectedFromStyle(
                        itemCount: dayRoutine.classes.length,
                        connectionDirection: ConnectionDirection.after,
                        connectorStyleBuilder: (context, index) {
                          return (index == 1)
                              ? ConnectorStyle.dashedLine
                              : ConnectorStyle.solidLine;
                        },
                        oppositeContentsBuilder: (context, index) => SizedBox(width: 0,),
                        indicatorStyleBuilder:
                            (context, index) => IndicatorStyle.dot,
                        contentsBuilder: (context, index) {
                          final routineClass = dayRoutine.classes[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: ListTile(
                              title: Text(
                                routineClass.courseName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.white,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Code: ${routineClass.courseCode}'),
                                  Text('Teacher: ${routineClass.teacherName}'),
                                  Text('Time: ${routineClass.time}'),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
