import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../utils/themes.dart';

// Model for a single class
class CourseInfo {
  final String courseName;
  final String courseCode;
  final int credit;
  final String teacherName;
  final String? additionalInfo;

  CourseInfo({
    required this.courseName,
    required this.courseCode,
    required this.credit,
    required this.teacherName,
    this.additionalInfo,
  });
}

// Model for a day's routine
class SemesterCourses {
  final String semester;
  final List<CourseInfo> courses;

  SemesterCourses({required this.semester, required this.courses});
}

// Example routine data for 3 days
final List<SemesterCourses> semesterCoursesList = [
  SemesterCourses(
    semester: 'Semester 1',
    courses: [
      CourseInfo(
        courseName: 'Mathematics',
        courseCode: 'MATH101',
        credit: 3,
        teacherName: 'Dr. Smith',
        additionalInfo: 'Compulsory',
      ),
      CourseInfo(
        courseName: 'Physics',
        courseCode: 'PHY101',
        credit: 3,
        teacherName: 'Prof. Johnson',
      ),
      CourseInfo(
        courseName: 'Chemistry',
        courseCode: 'CHEM101',
        credit: 3,
        teacherName: 'Dr. Lee',
      ),
    ],
  ),
  SemesterCourses(
    semester: 'Semester 2',
    courses: [
      CourseInfo(
        courseName: 'English',
        courseCode: 'ENG101',
        credit: 2,
        teacherName: 'Ms. Brown',
      ),
      CourseInfo(
        courseName: 'Computer Science',
        courseCode: 'CSE101',
        credit: 3,
        teacherName: 'Mr. White',
      ),
      CourseInfo(
        courseName: 'Biology',
        courseCode: 'BIO101',
        credit: 3,
        teacherName: 'Dr. Green',
      ),
    ],
  ),
  SemesterCourses(
    semester: 'Semester 3',
    courses: [
      CourseInfo(
        courseName: 'Statistics',
        courseCode: 'STAT101',
        credit: 3,
        teacherName: 'Dr. Black',
      ),
      CourseInfo(
        courseName: 'Programming',
        courseCode: 'CSE102',
        credit: 3,
        teacherName: 'Ms. Violet',
      ),
    ],
  ),
];

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
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

class _CoursesScreenState extends State<CoursesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Courses',
          style: TextStyle(color: MyColors.white),
        ),
        backgroundColor: MyColors.background,
      ),
      body: CustomScrollView(
        slivers:
            semesterCoursesList.map((semester) {
              return MultiSliver(
                pushPinnedChildren: true,
                children: [
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _DayHeaderDelegate(semester.semester),
                  ),
                  SliverList.builder(
                    itemCount: semester.courses.length,
                    itemBuilder: (context, index) {
                      final course = semester.courses[index];
                      // Course name as main label
                      Widget courseNameWidget = Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          course.courseName,
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
                                '${course.courseName} (${course.courseCode})',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: MyColors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Credit: ${course.credit}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColors.white.withAlpha(200),
                                ),
                              ),
                              Text(
                                'Teacher: ${course.teacherName}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColors.white.withAlpha(160),
                                ),
                              ),
                              if (course.additionalInfo != null)
                                Text(
                                  course.additionalInfo!,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: MyColors.white.withAlpha(120),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                      final cardWidget = Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          courseNameWidget,
                          infoCard,
                          SizedBox(height: 20),
                        ],
                      );

                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: TimelineTile(
                          alignment: TimelineAlign.start,
                          isFirst: index == 0,
                          isLast: index == semester.courses.length - 1,
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
    );
  }
}
