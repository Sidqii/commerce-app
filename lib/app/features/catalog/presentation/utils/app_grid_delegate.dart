import 'package:flutter/rendering.dart';

//setting grid di bagian widgets/card_screen_page.dart
class AppGridDelegate {
  static const catalogGrid = SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: 180,
    mainAxisSpacing: 15,
    crossAxisSpacing: 15,
    childAspectRatio: 0.68,
  );
}
