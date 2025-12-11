import 'package:flutter/material.dart';

class CustomFilterChips extends StatelessWidget {
  final List<String>? category;
  final String? selected;

  const CustomFilterChips({
    super.key,
    required this.category,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        scrollDirection: Axis.horizontal,
        itemCount: category!.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final item = category![index];

          bool isSelected = false;

          if (item == 'All' && selected == null) isSelected = true;

          if (selected == item) isSelected = true;

          return GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: isSelected ? Colors.grey.shade900 : Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  item,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.grey.shade900,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
