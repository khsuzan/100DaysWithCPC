import 'package:flutter/material.dart';
import '../../../utils/themes.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  int selectedDayIndex = 0;

  final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  final List<Map<String, dynamic>> schedules = [
    {
      'time': '08:00',
      'route': 'Route A',
      'status': 'On Time',
      'isFavorite': true,
    },
    {
      'time': '09:30',
      'route': 'Route B',
      'status': 'Delayed',
      'isFavorite': false,
    },
    {
      'time': '11:00',
      'route': 'Route C',
      'status': 'On Time',
      'isFavorite': false,
    },
    {
      'time': '13:00',
      'route': 'Route D',
      'status': 'Cancelled',
      'isFavorite': false,
    },
    {
      'time': '15:30',
      'route': 'Route A',
      'status': 'On Time',
      'isFavorite': true,
    },
    {
      'time': '17:00',
      'route': 'Route B',
      'status': 'On Time',
      'isFavorite': false,
    },
  ];

  Color getStatusColor(String status) {
    switch (status) {
      case 'On Time':
        return MyColors.black;
      case 'Delayed':
        return MyColors.gray;
      case 'Cancelled':
        return MyColors.gray;
      default:
        return MyColors.gray;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.grayLight,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with day navigation
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/arrow_back.svg',
                      color: MyColors.black,
                      width: 24,
                      height: 24,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Text(
                    'Schedule',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: MyColors.black,
                    ),
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/more_horiz.svg',
                      color: MyColors.black,
                      width: 24,
                      height: 24,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/chevron_left.svg',
                      color: MyColors.black,
                      width: 24,
                      height: 24,
                    ),
                    onPressed:
                        selectedDayIndex > 0
                            ? () => setState(() => selectedDayIndex--)
                            : null,
                  ),
                  Row(
                    children: List.generate(days.length, (i) {
                      final isSelected = i == selectedDayIndex;
                      return GestureDetector(
                        onTap: () => setState(() => selectedDayIndex = i),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected ? MyColors.black : MyColors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color:
                                  isSelected ? MyColors.black : MyColors.gray,
                            ),
                          ),
                          child: Text(
                            days[i],
                            style: TextStyle(
                              color:
                                  isSelected ? MyColors.white : MyColors.black,
                              fontWeight:
                                  isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/chevron_right.svg',
                      color: MyColors.black,
                      width: 24,
                      height: 24,
                    ),
                    onPressed:
                        selectedDayIndex < days.length - 1
                            ? () => setState(() => selectedDayIndex++)
                            : null,
                  ),
                ],
              ),
            ),
            // Schedule List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                itemCount: schedules.length,
                itemBuilder: (context, i) {
                  final schedule = schedules[i];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 14),
                    decoration: BoxDecoration(
                      color: MyColors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: MyColors.grayLight),
                      boxShadow: [
                        BoxShadow(
                          color: MyColors.buttonShadow,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      leading: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: MyColors.grayLight,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            schedule['time'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: MyColors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      title: Row(
                        children: [
                          Text(
                            schedule['route'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: MyColors.black,
                              fontSize: 16,
                            ),
                          ),
                          if (schedule['isFavorite'] == true)
                            Padding(
                              padding: EdgeInsets.only(left: 6),
                              child: SvgPicture.asset(
                                'assets/icons/star.svg',
                                color: MyColors.black,
                                width: 18,
                                height: 18,
                              ),
                            ),
                        ],
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          schedule['status'],
                          style: TextStyle(
                            color: getStatusColor(schedule['status']),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      trailing: IconButton(
                        icon: SvgPicture.asset(
                          'assets/icons/notifications_none.svg',
                          color: MyColors.black,
                          width: 22,
                          height: 22,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
