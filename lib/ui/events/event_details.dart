import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/ui/events/edit_event.dart';
import 'package:flutter/material.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text("Event Details".tr(), style: AppStyles.medium16blue),
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColors.bluePrimaryColor),
          actions: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    // TODO: Handle edit action
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EditEvent()));
                  },
                  icon: Image.asset(
                    'assets/images/appBar_edit_icon.png',
                    width: screenWidth * 0.07,
                    height: screenHeight * 0.07,
                    color: AppColors.bluePrimaryColor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Delete Event".tr(),
                            style: TextStyle(
                                color: Theme.of(context).primaryColor)),
                        content: Text(
                            "Are you sure you want to delete this event?".tr(),
                            style: TextStyle(
                                color: Theme.of(context).primaryColor)),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context), // Cancel
                            child: Text("Cancel".tr()),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Close the dialog
                              Navigator.pop(context); // Pop EventDetails screen
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text("Event deleted successfully.".tr()),
                                ),
                              );
                              // TODO: Also remove from your event list/data source
                            },
                            child: Text(
                              "Delete".tr(),
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: Image.asset(
                    'assets/images/appBar_delete_icon.png',
                    width: screenWidth * 0.07,
                    height: screenHeight * 0.07,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.02, horizontal: screenWidth * 0.04),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //////////////////////event image////////////////////////////
                Column(
                  children: [
                    Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset(AppAssets.sport_image)),
                    SizedBox(height: screenHeight * 0.02),
                    Text("We Are Going To Play Football",
                        style: AppStyles.medium16blue.copyWith(fontSize: 20)),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                ////////////////////event date and time edit button////////////////////////////
                InkWell(
                  onTap: () {
                    // TODO: Handle tap
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.bluePrimaryColor,
                        width: 1,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.007,
                      horizontal: screenWidth * 0.03,
                    ),
                    child: Row(
                      children: [
                        // Calendar icon
                        Image.asset(
                          AppAssets.calander_button_icon,
                          height: screenHeight * 0.05,
                          width: screenHeight * 0.05,
                        ),
                        SizedBox(width: screenWidth * 0.03),
                        // Date & Time
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "21 November 2024".tr(),
                              style: AppStyles.medium16blue,
                            ),
                            SizedBox(height: screenHeight * 0.005),
                            Text(
                              "12:12PM".tr(),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                ////////////////////////event location edit button////////////////////////////
                InkWell(
                  onTap: () {
                    // TODO:go to the map screen
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: AppColors.bluePrimaryColor, width: 1),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.01,
                          horizontal: screenWidth * 0.02),
                      child: Row(
                        children: [
                          Image.asset(
                            AppAssets.chooseEvent_icon,
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Text("Cairo , Egypt".tr(),
                              style: AppStyles.medium16blue),
                          Spacer(),
                          Icon(Icons.navigate_next,
                              color: AppColors.bluePrimaryColor),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Container(
                  child: Image.asset("assets/images/map_image.png"),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text("Description".tr(),
                    style: Theme.of(context).textTheme.bodyMedium),
                SizedBox(height: screenHeight * 0.01),
                Text(
                    "Lorem ipsum dolor sit amet consectetur. Vulputate eleifend suscipit eget neque senectus a. Nulla at non malesuada odio duis lectus amet nisi sit. Risus hac enim maecenas auctor et. At cras massa diam porta facilisi lacus purus. Iaculis eget quis ut amet. Sit ac malesuada nisi quis  feugiat."),
              ],
            ),
          ),
        ));
  }
}
