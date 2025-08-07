import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_styles.dart';
import '../home/widget/event_item.dart';
import '../widgets/custom_text_form_field.dart';

class LoveTabScreen extends StatelessWidget {
  const LoveTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * .05, vertical: screenHeight * .02),
            child: CustomTextFormField(
              controller: TextEditingController(),
              borderColor: AppColors.bluePrimaryColor,
              hintText: "Search For Event".tr(),
              hintStyle: AppStyles.medium16blue.copyWith(fontSize: 14),
              prefixIcon: Icon(Icons.search, color: AppColors.bluePrimaryColor),
            ),
          ),
          //SizedBox(height: screenHeight * .001),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: screenHeight * .01),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return EventItem();
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: screenHeight * .01);
                },
                itemCount: 20, //STATIC TILL WE MADE THE DATABASE
              ),
            ),
          ),
        ],
      ),
    );
  }
}
