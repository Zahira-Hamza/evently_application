import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/ui/home/tabs/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_routes.dart';
import '../../utils/app_styles.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.035, horizontal: screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(child: Image.asset(AppAssets.onboarding_logo)),
            SizedBox(height: screenHeight * 0.02),
            Image.asset('assets/images/welcome_image.png'),
            SizedBox(height: screenHeight * 0.02),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Personalize Your Experience'.tr(),
                style: AppStyles.bold20blue,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                  'Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.'
                      .tr(),
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
            SizedBox(height: screenHeight * 0.02),
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: AppColors.bluePrimaryColor,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(16.0),
            //     ),
            //   ),
            //   child: Text('Let’s Start', style: AppStyles.medium16black),
            //   onPressed: () {
            //     Navigator.pushNamed(context, AppRoutes.introRoute);
            //   },
            // ),
            CustomElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.introRoute);
              },
              buttonText:
                  Text("Let’s Start".tr(), style: AppStyles.medium16white),
            )
          ],
        ),
      ),
    ));
  }
}
