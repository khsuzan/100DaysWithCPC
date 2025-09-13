import 'package:flutter/material.dart';

import '../../../utils/themes.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  String? selectedStop;

  final Map<String, dynamic> currentRoute = {
    'name': 'Route A',
    'currentLocation': 'Near Science Building',
    'nextStop': 'Library',
    'capacity': 'few-seats',
    'eta': '3 min',
    'stops': [
      {'id': '1', 'name': 'Main Gate', 'status': 'passed', 'eta': '', 'favorite': false},
      {'id': '2', 'name': 'Student Center', 'status': 'passed', 'eta': '', 'favorite': true},
      {'id': '3', 'name': 'Science Building', 'status': 'current', 'eta': 'Now', 'favorite': false},
      {'id': '4', 'name': 'Library', 'status': 'upcoming', 'eta': '3 min', 'favorite': true},
      {'id': '5', 'name': 'Sports Complex', 'status': 'upcoming', 'eta': '8 min', 'favorite': false},
      {'id': '6', 'name': 'Dining Hall', 'status': 'upcoming', 'eta': '12 min', 'favorite': false},
      {'id': '7', 'name': 'Dormitory A', 'status': 'upcoming', 'eta': '15 min', 'favorite': false},
      {'id': '8', 'name': 'Parking Lot C', 'status': 'upcoming', 'eta': '18 min', 'favorite': false},
    ],
  };

  Color getStopStatusColor(String status) {
    switch (status) {
      case 'passed':
        return MyColors.gray;
      case 'current':
        return MyColors.black;
      case 'upcoming':
      default:
        return MyColors.grayLight;
    }
  }

  Color getCapacityBgColor(String capacity) {
    switch (capacity) {
      case 'empty':
        return MyColors.grayLight;
      case 'few-seats':
        return MyColors.gray;
      case 'full':
        return MyColors.black;
      default:
        return MyColors.grayLight;
    }
  }

  Color getCapacityTextColor(String capacity) {
    switch (capacity) {
      case 'empty':
        return MyColors.gray;
      case 'few-seats':
        return MyColors.black;
      case 'full':
        return MyColors.white;
      default:
        return MyColors.gray;
    }
  }

  String getCapacityIcon(String capacity) {
    switch (capacity) {
      case 'empty':
        return '○';
      case 'few-seats':
        return '◐';
      case 'full':
        return '●';
      default:
        return '○';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.grayLight,
      body: ListView(
        children: [
          // Header
          Container(
            color: MyColors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: MyColors.black),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(currentRoute['name'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: MyColors.black)),
                        Text(currentRoute['currentLocation'], style: const TextStyle(fontSize: 13, color: MyColors.gray)),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz, color: MyColors.black),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          // Bus Status Card
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Container(
              decoration: BoxDecoration(
                color: MyColors.white,
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: MyColors.grayLight),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: MyColors.grayLight,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  color: MyColors.black,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Bus Status', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: MyColors.black)),
                              SizedBox(height: 2),
                              Text('Live tracking active', style: TextStyle(fontSize: 13, color: MyColors.gray)),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: getCapacityBgColor(currentRoute['capacity']),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        child: Row(
                          children: [
                            Text(getCapacityIcon(currentRoute['capacity']), style: TextStyle(color: getCapacityTextColor(currentRoute['capacity']), fontWeight: FontWeight.bold)),
                            const SizedBox(width: 4),
                            Text(
                              currentRoute['capacity'] == 'few-seats' ? 'Few Seats' : currentRoute['capacity'],
                              style: TextStyle(color: getCapacityTextColor(currentRoute['capacity'])),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: MyColors.grayLight,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: MyColors.gray),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Next Stop', style: TextStyle(fontSize: 13, color: MyColors.gray)),
                              const SizedBox(height: 2),
                              Text(currentRoute['nextStop'], style: const TextStyle(fontSize: 16, color: MyColors.black)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: MyColors.grayLight,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: MyColors.gray),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('ETA', style: TextStyle(fontSize: 13, color: MyColors.gray)),
                              const SizedBox(height: 2),
                              Text(currentRoute['eta'], style: const TextStyle(fontSize: 16, color: MyColors.black)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Map Card
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Container(
              decoration: BoxDecoration(
                color: MyColors.white,
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: MyColors.grayLight),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.navigation, size: 20, color: MyColors.black),
                          SizedBox(width: 8),
                          Text('Live Map', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: MyColors.black)),
                        ],
                      ),
                      OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.location_pin, size: 16, color: MyColors.black),
                        label: const Text('Center', style: TextStyle(color: MyColors.black)),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: MyColors.gray),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          backgroundColor: MyColors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: MyColors.grayLight,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: MyColors.gray),
                    ),
                    child: Stack(
                      children: [
                        // Route line
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 180,
                            height: 4,
                            decoration: BoxDecoration(
                              color: MyColors.gray,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        // Animated bus icon
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: MyColors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text('🚌', style: TextStyle(color: MyColors.white, fontSize: 20)),
                            ),
                          ),
                        ),
                        // Map pin (decorative)
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Icon(Icons.location_pin, size: 32, color: MyColors.gray),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('Interactive map view', style: TextStyle(fontSize: 13, color: MyColors.gray)),
                  const Text('Real-time bus tracking', style: TextStyle(fontSize: 11, color: MyColors.gray)),
                ],
              ),
            ),
          ),
          // Route Timeline
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Container(
              decoration: BoxDecoration(
                color: MyColors.white,
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: MyColors.grayLight),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Route Timeline', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: MyColors.black)),
                  const SizedBox(height: 16),
                  ...List.generate(currentRoute['stops'].length, (index) {
                    final stop = currentRoute['stops'][index];
                    final isSelected = selectedStop == stop['id'];
                    final isCurrent = stop['status'] == 'current';
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedStop = isSelected ? null : stop['id'];
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isSelected || isCurrent ? MyColors.grayLight : MyColors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: isCurrent ? MyColors.black : MyColors.gray),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: getStopStatusColor(stop['status']),
                                    shape: BoxShape.circle,
                                    border: isCurrent ? Border.all(color: MyColors.black, width: 3) : null,
                                  ),
                                ),
                                if (index < currentRoute['stops'].length - 1)
                                  Positioned(
                                    left: 9,
                                    top: 20,
                                    child: Container(
                                      width: 2,
                                      height: 24,
                                      color: MyColors.gray,
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(stop['name'], style: TextStyle(fontSize: 15, color: isCurrent ? MyColors.black : MyColors.black)),
                                      if (stop['favorite'] == true)
                                        const Padding(
                                          padding: EdgeInsets.only(left: 4),
                                          child: Icon(Icons.star, size: 16, color: MyColors.black),
                                        ),
                                    ],
                                  ),
                                  if (isCurrent)
                                    const Padding(
                                      padding: EdgeInsets.only(top: 2),
                                      child: Text('🚌 Bus is here now', style: TextStyle(fontSize: 12, color: MyColors.black)),
                                    ),
                                ],
                              ),
                            ),
                            if (stop['eta'] != null && stop['eta'] != '')
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: stop['status'] == 'upcoming' ? MyColors.grayLight : MyColors.gray,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(Icons.access_time, size: 14, color: MyColors.gray),
                                    const SizedBox(width: 2),
                                    Text(stop['eta'], style: const TextStyle(fontSize: 12, color: MyColors.gray)),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          // Action Buttons
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.star, color: MyColors.white),
                    label: const Text('Save Stop'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.black,
                      foregroundColor: MyColors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      padding: const EdgeInsets.symmetric(vertical: 18),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none, color: MyColors.black),
                    label: const Text('Set Alert', style: TextStyle(color: MyColors.black)),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: MyColors.gray),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      backgroundColor: MyColors.white,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
