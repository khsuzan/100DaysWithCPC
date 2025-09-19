import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart' show GoRouter;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? selectedIndex;
  bool showHeader = true;
  bool showFab = true;
  double lastOffset = 0.0;

  final List<String> wallpapers = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/1.png',
    'assets/images/2.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background color fills entire screen
        Container(
          decoration: const BoxDecoration(
            color: Color(0xFF2B151A),
          ),
        ),
        // Content stays within SafeArea
        SafeArea(
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollUpdateNotification) {
                if (notification.metrics.pixels > lastOffset) {
                  // scrolling down
                  if (showHeader || showFab) {
                    setState(() {
                      showHeader = false;
                      showFab = false;
                    });
                  }
                } else if (notification.metrics.pixels < lastOffset) {
                  // scrolling up
                  if (!showHeader || !showFab) {
                    setState(() {
                      showHeader = true;
                      showFab = true;
                    });
                  }
                }
                lastOffset = notification.metrics.pixels;
              }
              return false;
            },
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(height: 12.h),
                      AnimatedSlide(
                        offset: showHeader ? Offset.zero : const Offset(0, -1),
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                        child: AnimatedOpacity(
                          opacity: showHeader ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 300),
                          child: Text(
                          'WALL-E',
                          style: TextStyle(
                            fontFamily: 'Pacifico',
                            fontSize: 32.sp,
                            color: Colors.white,
                            decoration: TextDecoration.none, // underline disabled
                          ),
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                    ],
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  sliver: SliverMasonryGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12.h,
                    crossAxisSpacing: 12.w,
                    childCount: wallpapers.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = selectedIndex == index ? null : index;
                          });
                        },
                        child: Stack(
                          children: [
                            Hero(
                              tag: 'wallpaper_$index',
                              child: Material(
                                elevation: 8,
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(24.r),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(24.r),
                                  child: Image.asset(
                                    wallpapers[index],
                                    fit: BoxFit.cover,
                                    height: (index % 2 == 0 ? 220.h : 320.h),
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                            ),
                            if (selectedIndex == index)
                              Positioned.fill(
                                child: Center(
                                  child: TweenAnimationBuilder<double>(
                                    tween: Tween<double>(begin: 0.7, end: 1.0),
                                    duration: const Duration(milliseconds: 350),
                                    curve: Curves.easeOutBack,
                                    builder: (context, scale, child) {
                                      return Transform.scale(
                                        scale: scale,
                                        child: GestureDetector(
                                          onTap: () {
                                            final imagePath = wallpapers[index];
                                            GoRouter.of(context).push('/wallpaper-view?imagePath=$imagePath');
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.black.withOpacity(0.25),
                                              borderRadius: BorderRadius.circular(16.r),
                                            ),
                                            padding: EdgeInsets.all(12.w),
                                            child: Icon(
                                              Icons.remove_red_eye,
                                              color: Colors.white,
                                              size: 36.sp,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 80.h)),
              ],
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 32.h,
          child: Center(
            child: AnimatedScale(
              scale: showFab ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
              child: FloatingActionButton(
                onPressed: () {
                  // TODO: Implement FAB action
                },
                backgroundColor: Colors.deepOrangeAccent,
                elevation: 8,
                shape: CircleBorder(),
                child: SvgPicture.asset(
                  'assets/icons/slide.svg',
                  colorFilter: const ColorFilter.mode(Color(0xFFFFF4E8), BlendMode.srcIn),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}