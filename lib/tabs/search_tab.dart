import 'package:flutter/material.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final List<Map<String, dynamic>> _all = [
    {'id': 1, 'name': 'Mägo de Oz', 'age': 29},
    {'id': 2, 'name': 'Avril Lavigne', 'age': 22},
    {'id': 3, 'name': 'Rihanna', 'age': 24},
    {'id': 4, 'name': 'Selena Gomez', 'age': 25},
    {'id': 5, 'name': 'Taylor Swift', 'age': 24},
    {'id': 6, 'name': 'La quinta estación', 'age': 28},
    {'id': 7, 'name': 'Queen', 'age': 22},
    {'id': 8, 'name': 'The Beatles', 'age': 23},
    {'id': 9, 'name': 'Coldplay', 'age': 28},
    {'id': 10, 'name': 'Linkin Park', 'age': 29}
  ];

  List<Map<String, dynamic>> _found = [];

  @override
  void initState() {
    _found = _all;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];

    if (enteredKeyword.isEmpty) {
      results = _all;
    } else {
      results = _all
          .where((element) => element[
              'name'.toLowerCase().contains(enteredKeyword.toLowerCase())])
          .toList();
    }

    setState(() {
      _found = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (value) => _runFilter(value),
          decoration: const InputDecoration(hintText: 'Buscar'),
        ),
        Expanded(
          child: _found.isNotEmpty
              ? ListView.builder(
                  itemCount: _found.length,
                  itemBuilder: (BuildContext context, int index) => Card(
                    key: ValueKey(_found[index]['id']),
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: Text(
                        _found[index]['id'].toString(),
                        style: const TextStyle(fontSize: 24),
                      ),
                      title: Text(_found[index]['name']),
                      subtitle: Text(
                        '${_found[index]['age'].toString()} canciones',
                      ),
                    ),
                  ),
                )
              : const Text(
                  'No results found',
                  style: TextStyle(fontSize: 24),
                ),
        ),
      ],
    );
  }
}
