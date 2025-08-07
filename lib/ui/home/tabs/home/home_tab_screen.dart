import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/ui/home/tabs/home/widget/event_item.dart';
import 'package:evently_app/ui/home/tabs/home/widget/event_tab_item.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class HomeTabScreen extends StatefulWidget {
  HomeTabScreen({super.key});

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    List<String> eventsName = [
      'All'.tr(),
      'Sport'.tr(),
      'Birthday'.tr(),
      'Meeting'.tr(),
      'Gaming'.tr(),
      'WorkShop'.tr(),
      'BookClub'.tr(),
      'Exhibition'.tr(),
      'Holiday'.tr(),
      'Eating'.tr()
    ];

    return Scaffold(
      appBar: AppBar(
        //toolbarHeight: screenHeight * .1,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome Back ✨".tr(),
                    style: AppStyles.medium16white.copyWith(fontSize: 14)),
                SizedBox(height: screenHeight * .01),
                Text("John Safwat",
                    style: AppStyles.bold20white.copyWith(fontSize: 24)),
              ],
            ),
            Spacer(),
            ImageIcon(
              AssetImage("assets/images/theme_icon.png"),
              color: AppColors.whitePrimaryColor,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * .02, right: screenWidth * .02),
              child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * .02,
                      vertical: screenHeight * .01),
                  decoration: BoxDecoration(
                      color: AppColors.whitePrimaryColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    "EN",
                    style: AppStyles.bold20white.copyWith(
                        fontSize: 14, color: AppColors.bluePrimaryColor),
                  )),
            ),
          ],
        ),
        bottom: AppBar(
          toolbarHeight: screenHeight * .13,
          automaticallyImplyLeading: false,
          title: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: AppColors.whitePrimaryColor,
                  ),
                  Text("Cairo , Egypt".tr(), style: AppStyles.medium16white),
                ],
              ),
              SizedBox(height: screenHeight * .015),

              //////////////////// tabs bar////////////////////////////
              DefaultTabController(
                length: eventsName.length,
                child: TabBar(
                    indicatorColor: AppColors.TransColor,
                    dividerColor: AppColors.TransColor,
                    labelPadding: EdgeInsets.zero,
                    tabAlignment: TabAlignment.start,
                    onTap: (index) {
                      ///index-> selected tab index(التابا اللى نا وقفا عندها)
                      selectedIndex = index;
                      setState(() {});
                    },
                    isScrollable: true,
                    tabs: eventsName.map(
                      (event) {
                        return EventTabItem(
                          selectedTextStyle:
                              Theme.of(context).textTheme.headlineMedium!,
                          unselectedTextStyle:
                              Theme.of(context).textTheme.headlineSmall!,
                          // borderColor: Theme.of(context).focusColor,
                          isSelected:
                              selectedIndex == eventsName.indexOf(event),
                          event: event,
                          selectedBgColor: Theme.of(context).focusColor,
                        );
                      },
                    ).toList()),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: screenHeight * .014),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return EventItem();
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: screenHeight * .01);
                },
                itemCount: 20,

                ///STATIC TILL WE MADE THE DATABASE
              ),
            ),
          ),
        ],
      ),
    );
  }
}
