import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<StatefulWidget> createState() => StateSearch();
}

class StateSearch extends State<Search> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final List lastSearch = [];
  final List<Widget> children = [];

  void writeLastSearch() async {
    if (_searchController.text.isNotEmpty && _searchController.text != ' ') {
      if (lastSearch.length == 3) {
        lastSearch.removeAt(0);
      }

      lastSearch.add(_searchController.text);
      await storage.write(key: 'last_search', value: jsonEncode(lastSearch));
    }
  }

  void setLastSearch() async {
    final storageData = await storage.read(key: 'last_search');
    late List data;

    if (storageData != null) {
      data = jsonDecode(storageData);

      for (var element in data) {
        lastSearch.add(element);
      }

      for (var index = data.length - 1; index >= 0; index--) {
        children.add(
          GestureDetector(
            onTap: () {
              writeLastSearch();
              Navigator.of(context).pop(data[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(data[index]),
                ],
              ),
            ),
          ),
        );
        children.add(
          Container(
            margin: const EdgeInsets.only(left: 0.0, right: 0.0),
            child: const Divider(
              height: 0.0,
              color: CupertinoColors.systemFill,
            ),
          ),
        );
      }
      setState(() {});
    }
  }

  @override
  void initState() {
    setLastSearch();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _searchFocusNode.requestFocus();
      },
    );
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            padding: const EdgeInsets.only(left: 16.0),
            child: const Icon(
              CupertinoIcons.left_chevron,
              color: Colors.orange,
            ),
          ),
        ),
        title: TextField(
          controller: _searchController,
          focusNode: _searchFocusNode,
          onSubmitted: (value) {
            writeLastSearch();
            Navigator.of(context).pop(_searchController.text);
          },
          decoration: InputDecoration(
            hintText: 'Kamu ingin cari apa?',
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: Colors.orange.shade300,
            ),
          ),
          style: const TextStyle(color: Colors.black),
          cursorColor: CupertinoColors.systemBlue,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              writeLastSearch();
              Navigator.of(context).pop(_searchController.text);
            },
            child: SvgPicture.asset(
              'assets/svg_image/loupe_search.svg',
              width: 24.0,
            ),
          ),
          const SizedBox(
            width: 32.0,
          ),
        ],
      ),
      backgroundColor: CupertinoColors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: children,
        ),
      ),
    );
  }
}
