import 'package:flutter/material.dart';

class Scoup extends StatefulWidget {
  final List<Widget> child;

  const Scoup({super.key, required this.child});

  @override
  State<Scoup> createState() => _ScoupState();
}

class _ScoupState extends State<Scoup> {
  bool _isDarkTheme = false;
  int _selectedIndex = 0;

  void _onItemTapped(int index) => setState(() => _selectedIndex = index);

  final MaterialStateProperty<Icon?> _thumbIcon = MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) return const Icon(Icons.dark_mode_outlined);

      return const Icon(Icons.light_mode_outlined);
    },
  );

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text('Irregular Verbs'),
          centerTitle: true,
          actions: [
            Switch(
              thumbIcon: _thumbIcon,
              value: _isDarkTheme,
              onChanged: (bool value) => setState(() => _isDarkTheme = value),
            ),
          ],
        ),
        body: widget.child[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.wordpress),
              label: 'Practice',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_sharp),
              label: 'Verbs List',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blueGrey,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
