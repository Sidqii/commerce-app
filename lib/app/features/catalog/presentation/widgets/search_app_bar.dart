import 'package:flutter/material.dart';

class SearchAppBar extends StatelessWidget {
  final VoidCallback onFocus;

  const SearchAppBar({super.key, required this.onFocus});

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
            hintText: 'Cari barang...',
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
