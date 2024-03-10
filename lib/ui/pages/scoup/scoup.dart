import 'package:flutter/material.dart';

class Scoup extends StatefulWidget {
  final List<Widget> child;

  const Scoup({super.key, required this.child});

  @override
  State<Scoup> createState() => _ScoupState();
}

class _ScoupState extends State<Scoup> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Irregular Verbs'),
        centerTitle: true,
      ),
      body: widget.child[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.track_changes_outlined),
            label: 'Practice',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_sharp),
            label: 'Verbs List',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}
