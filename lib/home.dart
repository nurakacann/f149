import 'package:flutter/material.dart';
import 'package:patico/pages/home_page.dart';
import 'package:patico/pages/profile_page.dart';
import 'package:patico/pages/search_page.dart';
//import 'package:patico/pages/Posts.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();

}


class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    homepage(),
    searchpage(),
    profilepage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label:'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label:'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label:'Profile'),
        ],
      ),
    );
  }
}

