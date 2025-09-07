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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _headerBar(),
            _gap(20.h),
            _upComingClasses(),
            _gap(20.h),
            _announces(),
          ],
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar(),
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
            bottom: BorderSide(color: MyColors.accentGreen.withAlpha(10)),
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
                  color: MyColors.accentGreen.withAlpha(50),
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
                      color: MyColors.accentGreen,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(50),
              highlightColor: MyColors.accentGreen.withAlpha(50),
              splashColor: MyColors.accentGreen.withAlpha(50),
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
            child: Text("Upcoming classes", style: TextStyle(fontSize: 18.sp)),
          ),
        ),
        _gap(4.h),
        SliverToBoxAdapter(
          child: DefaultHorizontalScreenPadding(
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: MyColors.accentGreen,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.w),
                  child: Text(
                    "06-Sep-25",
                    style: TextStyle(fontSize: 13.sp, color: MyColors.white),
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
        onTap: () {
          print("sdf"); 
        },
        highlightColor: MyColors.accentGreen.withAlpha(50),
        splashColor: MyColors.accentGreen.withAlpha(50),
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
                    color: MyColors.accentGreen.withAlpha(50),
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
                          color: MyColors.accentGreen,
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
                Text("Announces", style: TextStyle(fontSize: 18.sp)),
                Spacer(),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(50.h),
                  child: Container(
                    decoration: BoxDecoration(
                      color: MyColors.accentGreen,
                      borderRadius: BorderRadius.circular(6.r),
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
                  color: MyColors.accentGreen.withAlpha(50),
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
                        color: MyColors.accentGreen,
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
                            style: TextStyle(color: MyColors.accentGreen),
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

  Widget _bottomNavigationBar() {
    return SafeArea(
      top: false,
      child: Container(
        decoration: BoxDecoration(
          color: MyColors.background,
          border: Border(
            top: BorderSide(color: MyColors.accentGreen.withAlpha(10)),
          ),
        ),
        height: kBottomNavigationBarHeight + 10.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: _bottomNavigationItem(
                selected: true,
                name: "Dashboard",
                selectedSvgPath: "assets/icons/home_selected.svg",
                unSelectSvgPath: "assets/icons/home.svg",
                onTap: () {},
              ),
            ),
            Expanded(
              child: _bottomNavigationItem(
                selected: false,
                name: "Routine",
                selectedSvgPath: "assets/icons/mortarboard_selected.svg",
                unSelectSvgPath: "assets/icons/mortarboard.svg",
                onTap: () {},
              ),
            ),
            Expanded(
              child: _bottomNavigationItem(
                selected: false,
                name: "Coarses",
                selectedSvgPath: "assets/icons/list_tree.svg",
                unSelectSvgPath: "assets/icons/list_tree.svg",
                onTap: () {},
              ),
            ),
            Expanded(
              child: _bottomNavigationItem(
                selected: false,
                name: "Fees",
                selectedSvgPath: "assets/icons/fees_selected.svg",
                unSelectSvgPath: "assets/icons/fees.svg",
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavigationItem({
    required bool selected,
    required String name,
    required String unSelectSvgPath,
    required String selectedSvgPath,
    required Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      highlightColor: MyColors.accentGreen.withAlpha(50),
      splashColor: MyColors.accentGreen.withAlpha(50),
      child: ShaderMask(
        shaderCallback: (bounds) {
          if (selected) {
            // Solid color shader for selected
            return LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [MyColors.accentGreen, MyColors.accentGreenTransparent],
            ).createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height + 20),
            );
          } else {
            // Gradient for unselected
            return LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [MyColors.white, MyColors.whiteTransparent],
            ).createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height + 20),
            );
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              selected ? selectedSvgPath : unSelectSvgPath,
              height: 24.h,
              colorFilter: ColorFilter.mode(
                selected
                    ? MyColors.accentGreen
                    : const Color(0xFFA3A3A3).withAlpha(180),
                BlendMode.srcIn,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color:
                    selected
                        ? MyColors.accentGreen
                        : const Color(0xFFA3A3A3).withAlpha(180),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
