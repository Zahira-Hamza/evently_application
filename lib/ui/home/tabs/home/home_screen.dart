import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_routes.dart';
import '../love/love_tab_screen.dart';
import '../map/map_tab_screen.dart';
import '../profile/profile_tab_screen.dart';
import 'home_tab_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    ///* print("Current Locale: ${context.locale}");*///

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    List<Widget> tabs = [
      HomeTabScreen(),
      MapTabScreen(),
      LoveTabScreen(),
      ProfileTabScreen(),
    ];
    return Scaffold(
      ///////////////////bottom navigation bar///////////////////
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.01, horizontal: screenWidth * 0.001),
        color: Theme.of(context).primaryColor,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            items: [
              buildBottomNavigationBarItem(
                  index: 0,
                  unselected_iconName: "assets/images/home_icon.png",
                  selected_iconName: "assets/images/homeFull_icon.png",
                  label: "home".tr()),
              buildBottomNavigationBarItem(
                  index: 1,
                  unselected_iconName: "assets/images/map_icon.png",
                  selected_iconName: "assets/images/mapFull_icon.png",
                  label: "map".tr()),
              buildBottomNavigationBarItem(
                  index: 2,
                  unselected_iconName: "assets/images/love_icon.png",
                  selected_iconName: "assets/images/loveFull_icon.png",
                  label: "love".tr()),
              buildBottomNavigationBarItem(
                  index: 3,
                  unselected_iconName: "assets/images/profile_icon.png",
                  selected_iconName: "assets/images/profileFull_icon.png",
                  label: "profile".tr()),
            ]),
      ),
      ////////////////////floating action button///////////////////
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //todo:navigate to create event screen
          Navigator.of(context).pushNamed(AppRoutes.addEventRoute);
        },
        child: const Icon(Icons.add, color: Colors.white, size: 35),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[selectedIndex],
    );
  }

////////////////////method to build bottom navigation bar items///////////////////
  BottomNavigationBarItem buildBottomNavigationBarItem(
      {required String unselected_iconName,
      required String selected_iconName,
      required int index,
      required String label}) {
    return BottomNavigationBarItem(
        icon: ImageIcon(AssetImage(
            selectedIndex == index ? selected_iconName : unselected_iconName)),
        label: label);
  }
}
