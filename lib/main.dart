import 'package:flutter/material.dart';
import 'package:tic_tac_toe/pages/fav_page.dart';
import 'package:tic_tac_toe/pages/settings_page.dart';
import 'package:tic_tac_toe/pages/tic_tac_toe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const TicTacToeGame(), // Replace with your home page widget
    const SettingsPage(), // Replace with your settings page widget
    const FavPage(), // Replace with your favorites page widget
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Center(child: Text('TicTacToe game')),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.videogame_asset),
              label: 'TicTacToe',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorites',
            ),
          ],
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
        ),
    );
  }
}
