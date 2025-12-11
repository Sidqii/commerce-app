import 'package:flutter/material.dart';

class SearchInitial extends StatefulWidget {
  final String? initialKeyword;

  const SearchInitial({super.key, required this.initialKeyword});

  @override
  State<SearchInitial> createState() => _SearchInitialState();
}

class _SearchInitialState extends State<SearchInitial> {
  late final TextEditingController _controller;
  final _focusNode = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => _focusNode.requestFocus(),
    );

    _controller = TextEditingController(text: widget.initialKeyword ?? '');

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
      backgroundColor: const Color(0xfff5f5f5),
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
                    controller: _controller,
                    focusNode: _focusNode,
                    onChanged: (value) {},
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

              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  children: [
                    Text('Pencarian terakhir'),

                    const SizedBox(height: 10),

                    const ListTile(title: Text('Drone')),
                    const ListTile(title: Text('Wearable')),
                    const ListTile(title: Text('Kaos kaki')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
