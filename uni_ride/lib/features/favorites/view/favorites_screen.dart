import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/themes.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final List<Map<String, dynamic>> favorites = [
    {
      'name': 'Main Gate',
      'type': 'Stop',
      'route': 'Route A',
  'icon': 'assets/icons/location_pin.svg',
      'isActive': true,
    },
    {
      'name': 'Library',
      'type': 'Stop',
      'route': 'Route B',
  'icon': 'assets/icons/location_pin.svg',
      'isActive': false,
    },
    {
      'name': 'Route A',
      'type': 'Route',
      'route': 'Route A',
  'icon': 'assets/icons/directions_bus.svg',
      'isActive': true,
    },
    {
      'name': 'Dormitory A',
      'type': 'Stop',
      'route': 'Route C',
  'icon': 'assets/icons/location_pin.svg',
      'isActive': false,
    },
    {
      'name': 'Route B',
      'type': 'Route',
      'route': 'Route B',
  'icon': 'assets/icons/directions_bus.svg',
      'isActive': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.grayLight,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: SvgPicture.asset('assets/icons/arrow_back.svg', color: MyColors.black, width: 24, height: 24),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const Text(
                    'Favorites',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: MyColors.black,
                    ),
                  ),
                  IconButton(
                    icon: SvgPicture.asset('assets/icons/more_horiz.svg', color: MyColors.black, width: 24, height: 24),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Your favorite stops & routes',
                    style: TextStyle(fontSize: 15, color: MyColors.gray),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: SvgPicture.asset('assets/icons/add.svg', color: MyColors.black, width: 20, height: 20),
                    label: const Text('Add', style: TextStyle(color: MyColors.black)),
                    style: TextButton.styleFrom(
                      foregroundColor: MyColors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                    ),
                  ),
                ],
              ),
            ),
            // Favorites List
            Expanded(
              child: favorites.isEmpty
                  ? const Center(
                      child: Text('No favorites yet', style: TextStyle(color: MyColors.gray)),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      itemCount: favorites.length,
                      itemBuilder: (context, i) {
                        final fav = favorites[i];
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
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            leading: Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: fav['isActive'] ? MyColors.black : MyColors.grayLight,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  fav['icon'],
                                  color: fav['isActive'] ? MyColors.white : MyColors.black,
                                  width: 28,
                                  height: 28,
                                ),
                              ),
                            ),
                            title: Text(
                              fav['name'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: MyColors.black,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                fav['type'] == 'Route' ? 'Route' : 'Stop on ${fav['route']}',
                                style: const TextStyle(
                                  color: MyColors.gray,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: SvgPicture.asset('assets/icons/notifications_none.svg', color: MyColors.black, width: 22, height: 22),
                                  onPressed: () {},
                                  tooltip: 'Set Alert',
                                ),
                                IconButton(
                                  icon: SvgPicture.asset('assets/icons/delete_outline.svg', color: MyColors.black, width: 22, height: 22),
                                  onPressed: () {},
                                  tooltip: 'Remove',
                                ),
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
    );
  }
}
