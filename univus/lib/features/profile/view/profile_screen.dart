import 'package:flutter/material.dart';

import '../../../utils/themes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      body: Center(child: Text("Coming Soon!")),
    );
  }
}
