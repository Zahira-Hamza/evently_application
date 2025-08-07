///this homeScreen by using the package animated_bottom_navigation_bar
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreenB extends StatefulWidget {
  const HomeScreenB({super.key});

  @override
  State<HomeScreenB> createState() => _HomeScreenBState();
}

class _HomeScreenBState extends State<HomeScreenB> {
  int selectedIndex = 0;
  List<IconData> unselectedIconList = [
    Icons.home_outlined,
    Icons.map_outlined,
    Icons.favorite_border_outlined,
    Icons.person_2_outlined,
  ];
  List<IconData> selectedIconList = [
    Icons.home,
    Icons.map,
    Icons.favorite,
    Icons.person_2,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //todo:navigate to create event screen
        },
        child: const Icon(Icons.add, color: Colors.white, size: 35),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      ///***by defult this backage doesnot allow label to do it:
      ///we use AnimatedBottomNavigationBar.buider and we build the widget which is the icon and the label by ourselves*///
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        activeColor: Colors.white,
        inactiveColor: Colors.white,
        iconSize: 25,
        notchSmoothness: NotchSmoothness.softEdge,

        icons: List.generate(
            selectedIconList.length,
            (index) => index == selectedIndex
                ? selectedIconList[index]
                : unselectedIconList[index]),
        activeIndex: selectedIndex,
        gapLocation: GapLocation.center,
        onTap: (index) => setState(() => selectedIndex = index),
        //other params
      ),
    );
    ;
  }
}
