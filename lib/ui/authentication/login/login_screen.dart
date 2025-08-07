import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/utils/app_routes.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../home/tabs/home/home_screen.dart';
import '../../home/tabs/widgets/custom_elevated_button.dart';
import '../../home/tabs/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: screenHeight * .02, horizontal: screenWidth * .05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(AppAssets.auth_logo,
                    height: screenHeight * .25, width: screenWidth * .25),
                SizedBox(height: screenHeight * .02),

                //////////////////build login form with validation////////////////////
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextFormField(
                        controller: TextEditingController(),
                        hintText: "Email".tr(),
                        hintStyle: Theme.of(context).textTheme.headlineMedium,
                        prefixIcon: Icon(Icons.email,
                            color: Theme.of(context).disabledColor),
                      ),
                      SizedBox(height: screenHeight * .02),
                      CustomTextFormField(
                        controller: TextEditingController(),
                        hintText: "Password".tr(),
                        hintStyle: Theme.of(context).textTheme.headlineMedium,
                        prefixIcon: Icon(Icons.lock,
                            color: Theme.of(context).disabledColor),
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.visibility_off,
                                color: Theme.of(context).disabledColor)),
                      ),
                      SizedBox(height: screenHeight * .001),
                      Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              //todo: navigate to forget password screen
                              Navigator.pushNamed(
                                  context, AppRoutes.forgotPasswordRoute);
                            },
                            child: Text(
                              "Forget Password?".tr(),
                              style: AppStyles.medium16blue.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.bluePrimaryColor),
                            ),
                          )),
                      SizedBox(height: screenHeight * .001),
                      CustomElevatedButton(
                        onPressed: () {
                          //todo: navigate to home screen
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );
                        },
                        buttonText:
                            Text("Login".tr(), style: AppStyles.bold20white),
                      ),
                      SizedBox(height: screenHeight * .02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t Have Account ?".tr(),
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                          TextButton(
                            onPressed: () {
                              //todo: navigate to register screen
                              Navigator.pushNamed(
                                  context, AppRoutes.registerRoute);
                            },
                            child: Text(
                              "Create Account".tr(),
                              style: AppStyles.medium16blue.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.bluePrimaryColor),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: screenHeight * .02,
                            horizontal: screenWidth * .05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Divider(
                                color: AppColors.bluePrimaryColor,
                                thickness: 1,
                              ),
                            ),
                            SizedBox(width: screenWidth * .014),
                            Text("Or".tr(), style: AppStyles.medium16blue),
                            SizedBox(width: screenWidth * .014),
                            Expanded(
                              child: Divider(
                                color: AppColors.bluePrimaryColor,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ////////////////////////google login button///////////////////////////
                      Container(
                        height: screenHeight * .075,
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
                              SizedBox(width: screenWidth * 0.14),
                              Image.asset(AppAssets.google_icon),
                              SizedBox(width: screenWidth * 0.01),
                              Text("Login With Google".tr(),
                                  style: AppStyles.medium16blue
                                      .copyWith(fontSize: 20)),
                            ],
                          ),
                        ),
                      ),
                      ////////////////////////////switch language////////////////////////////
                    ],
                  ),
                ),
              ],
            )),
        // CustomTextFormField(
        //   hintText: "Email".tr(),
        //   hintStyle: Theme.of(context).textTheme.headlineMedium,
        //   prefixIcon:
        //       Icon(Icons.email, color: Theme.of(context).disabledColor),
        // ),
        // SizedBox(height: screenHeight * .02),
        // CustomTextFormField(
        //   hintText: "Password".tr(),
        //   hintStyle: Theme.of(context).textTheme.headlineMedium,
        //   prefixIcon:
        //       Icon(Icons.lock, color: Theme.of(context).disabledColor),
        //   suffixIcon: IconButton(
        //       onPressed: () {},
        //       icon: Icon(Icons.visibility_off,
        //           color: Theme.of(context).disabledColor)),
        // ),
        //   SizedBox(height: screenHeight * .001),
        //   Align(
        //       alignment: Alignment.centerRight,
        //       child: TextButton(
        //         onPressed: () {
        //           //todo: navigate to forget password screen
        //         },
        //         child: Text(
        //           "Forget Password?".tr(),
        //           style: AppStyles.medium16blue.copyWith(
        //               fontSize: 14,
        //               fontWeight: FontWeight.bold,
        //               decoration: TextDecoration.underline,
        //               decorationColor: AppColors.bluePrimaryColor),
        //         ),
        //       )),
        //   SizedBox(height: screenHeight * .001),
        //   CustomElevatedButton(
        //     onPressed: () {
        //       //todo: navigate to home screen
        //     },
        //     buttonText: Text("Login".tr(), style: AppStyles.bold20white),
        //   ),
        //   SizedBox(height: screenHeight * .02),
        //   Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Text(
        //         "Don’t Have Account ?".tr(),
        //         style: Theme.of(context).textTheme.headlineLarge?.copyWith(
        //               fontSize: 16,
        //               fontWeight: FontWeight.w400,
        //             ),
        //       ),
        //       TextButton(
        //         onPressed: () {},
        //         child: Text(
        //           "Create Account".tr(),
        //           style: AppStyles.medium16blue.copyWith(
        //               fontSize: 16,
        //               fontWeight: FontWeight.bold,
        //               decoration: TextDecoration.underline,
        //               decorationColor: AppColors.bluePrimaryColor),
        //         ),
        //       )
        //     ],
        //   ),
        //   Padding(
        //     padding: EdgeInsets.symmetric(
        //         vertical: screenHeight * .02,
        //         horizontal: screenWidth * .05),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Expanded(
        //           child: Divider(
        //             color: AppColors.bluePrimaryColor,
        //             thickness: 1,
        //           ),
        //         ),
        //         SizedBox(width: screenWidth * .014),
        //         Text("Or".tr(), style: AppStyles.medium16blue),
        //         SizedBox(width: screenWidth * .014),
        //         Expanded(
        //           child: Divider(
        //             color: AppColors.bluePrimaryColor,
        //             thickness: 1,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        //   CustomElevatedButton(
        //     onPressed: () {
        //       //todo: navigate to home screen
        //     },
        //     buttonText: Text("Login With Google".tr(),
        //         style: AppStyles.bold20blue
        //             .copyWith(fontWeight: FontWeight.w300)),
        //     backgroundColor: Colors.transparent,
        //   ),
        // ],
      ),
    );
  }
}
