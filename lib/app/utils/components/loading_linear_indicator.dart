import 'package:flutter/material.dart';

class LoadingLinearIndicator extends StatelessWidget {
  final double? width;

  const LoadingLinearIndicator({super.key, this.width});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width ?? 150,
        child: LinearProgressIndicator(
          color: Color(0xFF212121),
          minHeight: 1,
          backgroundColor: Color(0xFFE0E0E0),
        ),
      ),
    );
  }
}
