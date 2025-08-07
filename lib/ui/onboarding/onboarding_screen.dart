import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import '../authentication/login/login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      showSkipButton: false,
      showDoneButton: false,
      showBackButton: true,
      showNextButton: true,
      back: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
          border: Border.all(color: AppColors.bluePrimaryColor, width: 1),
        ),
        child: const Icon(Icons.arrow_back_ios,
            color: AppColors.bluePrimaryColor, size: 20),
      ),
      next: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
          border: Border.all(color: AppColors.bluePrimaryColor, width: 1),
        ),
        child: const Icon(Icons.arrow_forward_ios,
            color: AppColors.bluePrimaryColor, size: 20),
      ),
      onDone: () {},
      onSkip: () {},
      onChange: (index) {
        if (index == 2) {
          Future.delayed(Duration(milliseconds: 300), () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => LoginScreen()),
            );
          });
        }
      },
      pages: [
        buildPage(
          context,
          screenHeight,
          screenWidth,
          image: 'assets/images/intro_1.png',
          subImage: AppAssets.onboarding_logo,
          title: 'Find Events That Inspire You'.tr(),
          subtitle:
              'Dive into a world of events crafted to fit your unique interests. Whether you\'re into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.'
                  .tr(),
        ),
        buildPage(
          context,
          screenHeight,
          screenWidth,
          image: 'assets/images/intro_2.png',
          subImage: AppAssets.onboarding_logo,
          title: 'Effortless Event Planning'.tr(),
          subtitle:
              'Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.'
                  .tr(),
        ),
        buildPage(
          context,
          screenHeight,
          screenWidth,
          image: 'assets/images/intro_3.png',
          subImage: AppAssets.onboarding_logo,
          title: 'Connect with Friends & Share Moments'.tr(),
          subtitle:
              'Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.'
                  .tr(),
        ),
      ],
    );
  }

  PageViewModel buildPage(
    BuildContext context,
    double screenHeight,
    double screenWidth, {
    required String image,
    required String subImage,
    required String title,
    required String subtitle,
  }) {
    return PageViewModel(
      title: "",
      body: "",
      decoration: const PageDecoration(
        imageFlex: 1,
        bodyFlex: 0,
        fullScreen: true,
        safeArea: 0,
      ),
      image: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                subImage,
                height: screenHeight * 0.15,
              ),
              SizedBox(height: screenHeight * 0.01),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                  height: screenHeight * 0.35,
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Text(
                  title,
                  textAlign: TextAlign.start,
                  style: AppStyles.bold20blue,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05,
                    vertical: screenHeight * 0.03),
                child: Text(
                  subtitle,
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
