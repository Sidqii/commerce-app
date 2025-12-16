import 'package:flutter/material.dart';

class LinearLoadingIndicator extends StatelessWidget {
  const LinearLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 150,
        child: LinearProgressIndicator(
          color: Color(0xFF212121),
          minHeight: 1,
          backgroundColor: Color(0xFFE0E0E0),
        ),
      ),
    );
  }
}
