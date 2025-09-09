import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:timeline_tile/timeline_tile.dart';

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
      RoutineClass(
        time: '11:30 - 1:00',
        courseName: 'Chemistry',
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
];

class RoutineScreen extends StatefulWidget {
  const RoutineScreen({super.key});

  @override
  State<RoutineScreen> createState() => _RoutineScreenState();
}

class _DayHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String day;
  _DayHeaderDelegate(this.day);

  @override
  double get minExtent => 48;
  @override
  double get maxExtent => 48;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: MyColors.background,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        day,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: MyColors.white,
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
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
      body: CustomScrollView(
        slivers:
            routineData.map((data) {
              return MultiSliver(
                pushPinnedChildren: true,
                children: [
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _DayHeaderDelegate(data.day),
                  ),
                  SliverList.builder(
                    itemCount: data.classes.length,
                    itemBuilder: (context, index) {
                      final routineClass = data.classes[index];
                      // Time on the left
                      Widget timeWidget = Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          routineClass.time,
                          style: TextStyle(
                            color: MyColors.accentGreen,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      );
                      // Card with colored strip and info
                      Widget infoCard = Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 8.0,
                        ),
                        decoration: BoxDecoration(
                          color: MyColors.accentGreen.withAlpha(30),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 16.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${routineClass.courseName} (${routineClass.courseCode})',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: MyColors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                routineClass.teacherName,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColors.white.withAlpha(160),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                      final cardWidget = Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [timeWidget, infoCard, SizedBox(height: 20)],
                      );

                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: TimelineTile(
                          alignment: TimelineAlign.start,
                          isFirst: index == 0,
                          isLast: index == data.classes.length - 1,
                          indicatorStyle: IndicatorStyle(
                            width: 16,
                            color: MyColors.accentGreen,
                            indicatorXY: 0.1,
                            indicator: Container(
                              decoration: BoxDecoration(
                                color: MyColors.accentGreen,
                                shape: BoxShape.circle,
                              ),
                              child: Center(child: Text("${index + 1}")),
                            ),
                          ),
                          beforeLineStyle: const LineStyle(
                            color: MyColors.accentGreenTransparent,
                            thickness: 4,
                          ),
                          endChild: cardWidget,
                        ),
                      );
                    },
                  ),
                ],
              );
            }).toList(),
      ),
      floatingActionButton: _floatingActionButton(context: context),
    );
  }

  Widget _floatingActionButton({required BuildContext context}) {
    return ShaderMask(
      shaderCallback: (bounds) {
        // Solid color shader for selected
        return LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [MyColors.accentGreen, MyColors.accentGreenDark],
        ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height + 20));
      },
      child: Container(
        decoration: BoxDecoration(
          color: MyColors.accentGreen,
          borderRadius: SmoothBorderRadius.all(
            SmoothRadius(cornerRadius: 16, cornerSmoothing: 1.0),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              "assets/icons/list_tree.svg",
              height: 24.h,
              colorFilter: ColorFilter.mode(MyColors.white, BlendMode.srcIn),
            ),
            SizedBox(width: 8.w),
            Text(
              "Courses",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: MyColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
