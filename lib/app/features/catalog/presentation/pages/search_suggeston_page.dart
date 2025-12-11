import 'package:flutter/material.dart';

class SearchSuggestonPage extends StatefulWidget {
  const SearchSuggestonPage({super.key});

  @override
  State<SearchSuggestonPage> createState() => _SearchSuggestonPageState();
}

class _SearchSuggestonPageState extends State<SearchSuggestonPage> {
  final _focusNode = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => _focusNode.requestFocus(),
    );

    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => FocusScope.of(context).unfocus(),

          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextField(
                    focusNode: _focusNode,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
