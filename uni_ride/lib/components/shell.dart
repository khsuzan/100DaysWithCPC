import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../utils/themes.dart';

class DashboardShell extends StatelessWidget {
  final Widget child;
  const DashboardShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      resizeToAvoidBottomInset: false,
      body: child,
      bottomNavigationBar: _bottomNavigationBar(
        context: context,
        goToHome: () {
          context.push('/home');
        },
        goToMap: () {
          context.push('/map');
        },
        goToSchedule: () {
          context.push('/schedule');
        },
        goToFavorites: () {
          context.push('/favorites');
        },
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/home')) return 0;
    if (location.startsWith('/map')) return 1;
    if (location.startsWith('/schedule')) return 2;
    if (location.startsWith('/favorites')) return 3;
    return 0;
  }

  Widget _bottomNavigationBar({
    required BuildContext context,
    required VoidCallback goToHome,
    required VoidCallback goToMap,
    required VoidCallback goToSchedule,
    required VoidCallback goToFavorites,
  }) {
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
                selected: _calculateSelectedIndex(context) == 0,
                name: "Home",
                selectedSvgPath: "assets/icons/home_selected.svg",
                unSelectSvgPath: "assets/icons/home.svg",
                onTap: () {
                  if (_calculateSelectedIndex(context) != 0) {
                    goToHome();
                  }
                },
              ),
            ),
            Expanded(
              child: _bottomNavigationItem(
                selected: _calculateSelectedIndex(context) == 1,
                name: "Map",
                selectedSvgPath: "assets/icons/map_selected.svg",
                unSelectSvgPath: "assets/icons/map.svg",
                onTap: () {
                  if (_calculateSelectedIndex(context) != 1) {
                    goToMap();
                  }
                },
              ),
            ),
            Expanded(
              child: _bottomNavigationItem(
                selected: _calculateSelectedIndex(context) == 2,
                name: "Schedule",
                selectedSvgPath: "assets/icons/schedule_selected.svg",
                unSelectSvgPath: "assets/icons/schedule.svg",
                onTap: () {
                  if (_calculateSelectedIndex(context) != 2) {
                    goToSchedule();
                  }
                },
              ),
            ),
            Expanded(
              child: _bottomNavigationItem(
                selected: _calculateSelectedIndex(context) == 3,
                name: "Favorites",
                selectedSvgPath: "assets/icons/favorites_selected.svg",
                unSelectSvgPath: "assets/icons/favorites.svg",
                onTap: () {
                  if (_calculateSelectedIndex(context) != 3) {
                    goToFavorites();
                  }
                },
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
