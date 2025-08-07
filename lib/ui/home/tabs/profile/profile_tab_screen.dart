import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/ui/home/tabs/profile/theme/theme_bottom_sheet.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
import 'language/language_bottom_sheet.dart';

class ProfileTabScreen extends StatefulWidget {
  const ProfileTabScreen({super.key});

  @override
  State<ProfileTabScreen> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTabScreen> {
  final FocusNode _languageFocusNode = FocusNode();
  final FocusNode _themeFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _languageFocusNode.addListener(() {
      if (_languageFocusNode.hasFocus) {
        _languageFocusNode.unfocus();
        showLanguageBottomSheet();
      }
    });

    _themeFocusNode.addListener(() {
      if (_themeFocusNode.hasFocus) {
        _themeFocusNode.unfocus();
        showThemeBottomSheet();
      }
    });
  }

  @override
  void dispose() {
    _languageFocusNode.dispose();
    _themeFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenHeight * .2,
        backgroundColor: AppColors.bluePrimaryColor,
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: screenHeight * .05),
          child: Row(
            children: [
              Image.asset("assets/images/profile_photo.png"),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * .05,
                      vertical: screenHeight * .01),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "John Safwat",
                        style: AppStyles.bold20white,
                      ),
                      SizedBox(height: screenHeight * .01),
                      Text(
                        "johnsafwat.route@gmail.com",
                        style: AppStyles.medium16black
                            .copyWith(color: Colors.white),
                        softWrap: true,
                        maxLines: 5,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ), // استخدم الترجمة هنا
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(45),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * .04,
          horizontal: screenWidth * .03,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
// ----------------- Language -----------------
            Text(
              "language".tr(),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: screenHeight * .02),
            SizedBox(
              height: 44,
              child: TextField(
                focusNode: _languageFocusNode,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'hint_language'.tr(), // الترجمة هنا
                  hintStyle: AppStyles.bold20blue.copyWith(fontSize: 16),
                  suffixIcon: const Icon(
                    Icons.arrow_drop_down,
                    color: AppColors.bluePrimaryColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: AppColors.bluePrimaryColor,
                      width: 0.3,
                    ),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: AppColors.bluePrimaryColor,
                      width: 0.6,
                    ),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 8.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * .03),

// ----------------- Theme -----------------
            Text(
              "theme".tr(),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: screenHeight * .02),
            SizedBox(
              height: 44,
              child: TextField(
                focusNode: _themeFocusNode,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'light'.tr(), // الترجمة هنا
                  hintStyle: AppStyles.bold20blue.copyWith(fontSize: 16),
                  suffixIcon: const Icon(
                    Icons.arrow_drop_down,
                    color: AppColors.bluePrimaryColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: AppColors.bluePrimaryColor,
                      width: 0.3,
                    ),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: AppColors.bluePrimaryColor,
                      width: 0.6,
                    ),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 8.0,
                  ),
                ),
              ),
            ),
            Spacer(),
            // ----------------- Logout button -----------------
            ElevatedButton(
              onPressed: () {
                //todo:logout
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * .02,
                    vertical: screenHeight * .02),
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      width: screenWidth * .01,
                    ),
                    Text(
                      'logout'.tr(),
                      style: AppStyles.bold20white,
                    ),
                  ],
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageBottomSheet(),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ThemeBottomSheet(),
    );
  }
}
