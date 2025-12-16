import 'package:flutter/material.dart';

class SearchInitialBar extends StatelessWidget {
  final VoidCallback onFocus;

  const SearchInitialBar({super.key, required this.onFocus});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: TextField(
          readOnly: true,
          onTap: onFocus,
          decoration: InputDecoration(
            isDense: true,
            hintText: 'Cari produk...',
            prefixIcon: const Icon(Icons.search),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
      ),
    );
  }
}
