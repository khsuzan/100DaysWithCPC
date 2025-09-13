import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_header_adaptive/persistent_header_adaptive.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../utils/themes.dart';
import '../../../utils/widgets.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  final List<Map<String, dynamic>> _routes = [
    {
      'id': 'route-a',
      'name': 'Route A',
      'status': 'approaching',
      'nextArrival': '3 min',
      'capacity': 'few-seats',
      'stops': 8,
      'estimatedTime': '25 min',
    },
    {
      'id': 'route-b',
      'name': 'Route B',
      'status': 'active',
      'nextArrival': '8 min',
      'capacity': 'empty',
      'stops': 6,
      'estimatedTime': '18 min',
    },
    {
      'id': 'route-c',
      'name': 'Route C',
      'status': 'delayed',
      'nextArrival': '12 min',
      'capacity': 'full',
      'stops': 10,
      'estimatedTime': '32 min',
    },
    {
      'id': 'route-d',
      'name': 'Route D',
      'status': 'active',
      'nextArrival': '15 min',
      'capacity': 'few-seats',
      'stops': 5,
      'estimatedTime': '20 min',
    },
  ];

  final List<Map<String, dynamic>> _quickActions = [
    {
      'icon': Icons.map,
      'label': 'Live Map',
      'onTap': null, // TODO: Implement navigation
    },
    {
      'icon': Icons.calendar_today,
      'label': 'Schedules',
      'onTap': null,
    },
    {
      'icon': Icons.star,
      'label': 'Favorites',
      'onTap': null,
    },
    {
      'icon': Icons.alt_route,
      'label': 'Routes',
      'onTap': null,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredRoutes = _routes.where((route) =>
      route['name'].toLowerCase().contains(_searchQuery.toLowerCase())
    ).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Status Bar (simulated)
            Container(
              height: 48,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Color(0xFFF1F5F9))),
              ),
              child: const Text('9:41 AM', style: TextStyle(color: Colors.black, fontSize: 16)),
            ),
            // Header
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Good morning!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)),
                      SizedBox(height: 4),
                      Text('Ready to catch your bus?', style: TextStyle(fontSize: 15, color: Colors.grey)),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.notifications_none, color: Colors.black),
                        onPressed: () {},
                        splashRadius: 24,
                      ),
                      IconButton(
                        icon: const Icon(Icons.person_outline, color: Colors.black),
                        onPressed: () {},
                        splashRadius: 24,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Search
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  const Icon(Icons.search, color: Colors.grey, size: 22),
                  Padding(
                    padding: const EdgeInsets.only(left: 36),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (v) => setState(() => _searchQuery = v),
                      decoration: InputDecoration(
                        hintText: 'Search routes or stops...',
                        filled: true,
                        fillColor: const Color(0xFFF1F5F9),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Color(0xFFE5E7EB)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Color(0xFFE5E7EB)),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        isDense: true,
                      ),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            // Quick Actions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: const Color(0xFFF1F5F9)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Quick Actions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 16),
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      physics: const NeverScrollableScrollPhysics(),
                      children: _quickActions.map((action) {
                        return InkWell(
                          onTap: action['onTap'],
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFF9FAFB),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: const Color(0xFFE5E7EB)),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Icon(action['icon'], color: Colors.white, size: 22),
                                ),
                                const SizedBox(height: 10),
                                Text(action['label'], style: const TextStyle(fontSize: 14, color: Colors.black)),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            // Live Bus Status
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: const Color(0xFFF1F5F9)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Live Bus Status', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F5F9),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: const Color(0xFFE5E7EB)),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          child: Row(
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                ),
                                margin: const EdgeInsets.only(right: 6),
                              ),
                              Text('${filteredRoutes.length} Active', style: const TextStyle(fontSize: 13, color: Colors.black)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Column(
                      children: filteredRoutes.map((route) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF9FAFB),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: const Color(0xFFE5E7EB)),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.directions_bus, color: Colors.black, size: 32),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(route['name'], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 4),
                                    Text('Next: ${route['nextArrival']} • Stops: ${route['stops']}', style: const TextStyle(fontSize: 13, color: Colors.grey)),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                decoration: BoxDecoration(
                                  color: route['status'] == 'delayed' ? Colors.red[100] : Colors.green[100],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  route['status'] == 'delayed' ? 'Delayed' : 'On Time',
                                  style: TextStyle(
                                    color: route['status'] == 'delayed' ? Colors.red : Colors.green,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            // Recent Activity
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: const Color(0xFFF1F5F9)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(bottom: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Recent Activity', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 16),
                    _recentActivityDot('Route A approaching Library Stop', '2 minutes ago', Colors.black),
                    const SizedBox(height: 12),
                    _recentActivityDot('Route C delayed due to traffic', '5 minutes ago', Colors.grey),
                    const SizedBox(height: 12),
                    _recentActivityDot('Route B service resumed', '10 minutes ago', Colors.grey),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _recentActivityDot(String text, String time, Color dotColor) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 12,
          height: 12,
          margin: const EdgeInsets.only(top: 4),
          decoration: BoxDecoration(
            color: dotColor,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text, style: const TextStyle(fontSize: 15)),
              const SizedBox(height: 2),
              Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ),
      ],
    );
  }

  SliverToBoxAdapter _gap(double gap) {
    return SliverToBoxAdapter(child: SizedBox(height: gap));
  }

  AdaptiveHeightSliverPersistentHeader _headerBar() {
    return AdaptiveHeightSliverPersistentHeader(
      floating: true,
      needRepaint: true,
      child: Container(
        decoration: BoxDecoration(
          color: MyColors.background,
          border: Border(
            bottom: BorderSide(color: MyColors.accent.withAlpha(10)),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(6.h),
              child: ClipOval(
                child: Container(
                  height: 48.h,
                  width: 48.h,
                  color: MyColors.accent.withAlpha(50),
                  child: Image.asset("assets/images/robo.png"),
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Welcome back,",
                    style: TextStyle(fontSize: 13.sp, color: MyColors.gray),
                  ),
                  Text(
                    "Kawsar",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: MyColors.accent,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(50),
              highlightColor: MyColors.accent.withAlpha(50),
              splashColor: MyColors.accent.withAlpha(50),
              child: Padding(
                padding: EdgeInsets.all(12.w),
                child: SvgPicture.asset(
                  "assets/icons/bell_dot.svg",
                  height: 24.h,
                  width: 24.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  MultiSliver _upComingClasses() {
    return MultiSliver(
      children: [
        SliverToBoxAdapter(
          child: DefaultHorizontalScreenPadding(
            child: Row(
              children: [
                Text(
                  "Upcoming classes".toUpperCase(),
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(50.h),
                  child: Container(
                    decoration: BoxDecoration(
                      color: MyColors.accent,
                      borderRadius: SmoothBorderRadius(
                        cornerRadius: 8.r,
                        cornerSmoothing: 1.0,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.w,
                      vertical: 4.w,
                    ),
                    child: Text(
                      "6-Sep-2025",
                      style: TextStyle(fontSize: 13.sp, color: MyColors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate.fixed(
            List.generate(5, (index) {
              return _upComingClass();
            }),
          ),
        ),
      ],
    );
  }

  Widget _upComingClass() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: InkWell(
        onTap: () {},
        highlightColor: MyColors.accent.withAlpha(50),
        splashColor: MyColors.accent.withAlpha(50),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          color: MyColors.backgroundLight,
          child: DefaultHorizontalScreenPadding(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: MyColors.accent.withAlpha(50),
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                  child: Image.asset("assets/images/robo.png"),
                ),
                SizedBox(width: 6.w),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Chemistry",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: MyColors.accent,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "6:00PM - 7:40PM",
                        style: TextStyle(fontSize: 13.sp, color: MyColors.gray),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Room 502",
                  style: TextStyle(fontSize: 13.sp, color: MyColors.gray),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  MultiSliver _announces() {
    return MultiSliver(
      children: [
        SliverToBoxAdapter(
          child: DefaultHorizontalScreenPadding(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Announces".toUpperCase(),
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(50.h),
                  child: Container(
                    decoration: BoxDecoration(
                      color: MyColors.accent,
                      borderRadius: SmoothBorderRadius(
                        cornerRadius: 8.r,
                        cornerSmoothing: 1.0,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.w,
                      vertical: 4.w,
                    ),
                    child: Text(
                      "Show All",
                      style: TextStyle(fontSize: 13.sp, color: MyColors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        _gap(4.h),
        SliverList(
          delegate: SliverChildListDelegate.fixed(
            List.generate(2, (index) {
              return _announcement();
            }),
          ),
        ),
      ],
    );
  }

  Widget _announcement() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        color: MyColors.backgroundLight,
        child: DefaultHorizontalScreenPadding(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: MyColors.accent.withAlpha(50),
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child: Image.asset("assets/images/robo.png"),
              ),
              SizedBox(width: 6.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Campuse cloasure notice",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: MyColors.accent,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text.rich(
                      TextSpan(
                        text:
                            "Due to inclement weather, the campus will remain close on monday 23th October ...",
                        children: [
                          TextSpan(
                            text: "Read More",
                            style: TextStyle(color: MyColors.accent),
                          ),
                        ],
                        style: TextStyle(color: MyColors.gray),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
