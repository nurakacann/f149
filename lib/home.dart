import 'package:flutter/material.dart';
import 'package:patico/pages/home_page.dart';
import 'package:patico/pages/profile_page.dart';
import 'package:patico/pages/search_page.dart';
import 'package:patico/pages/add_page.dart';
import 'package:patico/utils/colors.dart';

class HomePageNavigator extends StatefulWidget {
  const HomePageNavigator({Key? key}) : super(key: key);


  @override
  State<HomePageNavigator> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageNavigator> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomePage(),
    AddPage(),
    SearchPage(),
    ProfilPage(),

  ];
  /*void searchFunc(String value) {
    for (var people in peopleList) {
      if (people!.firstName!
          .toLowerCase()
          .trim()
          .contains(searchController.text.toLowerCase().trim())) {
        searchList.add(people);
        setState(() {});
      }
    }
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, size:35, color: _selectedIndex==0 ?  primaryColor: secondaryColor,),
              label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.add, size:35, color: _selectedIndex==1 ?  primaryColor: secondaryColor,),
              label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search, size:35, color: _selectedIndex==2 ?  primaryColor: secondaryColor,),
              label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person, size:35, color: _selectedIndex==3 ?  primaryColor: secondaryColor,),
              label: ''),
        ],
      ),
    );
  }
}
