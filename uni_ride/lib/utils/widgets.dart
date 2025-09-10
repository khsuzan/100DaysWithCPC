import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultHorizontalScreenPadding extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;

  const DefaultHorizontalScreenPadding({
    super.key,
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: (padding ?? EdgeInsets.zero).copyWith(left: 16.w, right: 16.w), 
      child: child,
    );
  }
}
