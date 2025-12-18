import 'package:flutter/material.dart';

class WidgetSuggestion extends StatelessWidget {
  const WidgetSuggestion({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ListTile(title: Text('Drone Official')),

        ListTile(title: Text('Radio Murah')),

        ListTile(title: Text('Wearable Baru')),
      ],
    );
  }
}
