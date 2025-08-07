import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/app_assets.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_styles.dart';
import '../../../../events/event_details.dart';

class EventItem extends StatelessWidget {
  const EventItem({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => EventDetails()));
      },
      child: Container(
        height: screenHeight * .25,
        width: screenWidth,
        margin: EdgeInsets.symmetric(
            horizontal: screenWidth * .05, vertical: screenHeight * .0018),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.sport_image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.bluePrimaryColor, width: 1)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                margin: EdgeInsets.symmetric(
                    vertical: screenHeight * .01,
                    horizontal: screenWidth * .02),
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * .024,
                    vertical: screenHeight * .0014),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(children: [
                  Text("22", style: AppStyles.bold20blue),
                  Text("Nov",
                      style: AppStyles.bold20blue.copyWith(fontSize: 14)),
                ])),
            Container(
                margin: EdgeInsets.symmetric(
                    vertical: screenHeight * .01,
                    horizontal: screenWidth * .02),
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * .024,
                    vertical: screenHeight * .002),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).cardColor),
                child: Row(children: [
                  Text("This is a Sport Event ".tr(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(fontSize: 14)),
                  Spacer(),
                  Icon(Icons
                      .favorite_rounded), //need to be fixed->asset,Image.asset+inkwell
                ]))
          ],
        ),
      ),
    );
  }
}
