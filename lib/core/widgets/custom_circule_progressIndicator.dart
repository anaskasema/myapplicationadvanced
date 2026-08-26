import 'package:flutter/material.dart';

// ويدجت مخصص لمؤشر التحميل (Circular Progress Indicator)
class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key, this.color = Colors.amber});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: 3,
      ),
    );
  }
}
