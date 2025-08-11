import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/utils/app_routes.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../home/tabs/home/home_screen.dart';
import '../../home/tabs/widgets/custom_elevated_button.dart';
import '../../home/tabs/widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isPasswordHidden = true; // added for toggle

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * .02,
            horizontal: screenWidth * .05,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  AppAssets.auth_logo,
                  height: screenHeight * .25,
                  width: screenWidth * .25,
                ),
                SizedBox(height: screenHeight * .02),

                /// Login form
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ////////////////////// Email field//////////////////
                      CustomTextFormField(
                        textEditingController: emailController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "Email is required".tr();
                          }
                          final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                          ).hasMatch(text.trim());
                          if (!emailValid) {
                            return "Invalid Email".tr();
                          }
                          return null;
                        },
                        hintText: "Email".tr(),
                        hintStyle: Theme.of(context).textTheme.headlineMedium,
                        prefixIcon: Icon(
                          Icons.email,
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                      SizedBox(height: screenHeight * .02),

                      //////////////////// Password field///////////////
                      CustomTextFormField(
                        textEditingController: passwordController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "Password is required".tr();
                          }
                          if (text.trim().length < 6) {
                            return "Password must be at least 6 characters"
                                .tr();
                          }
                          return null;
                        },
                        obscureText: _isPasswordHidden,
                        hintText: "Password".tr(),
                        hintStyle: Theme.of(context).textTheme.headlineMedium,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Theme.of(context).disabledColor,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isPasswordHidden = !_isPasswordHidden;
                            });
                          },
                          icon: Icon(
                            _isPasswordHidden
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Theme.of(context).disabledColor,
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * .001),

                      /// Forget password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.forgotPasswordRoute,
                            );
                          },
                          child: Text(
                            "Forget Password?".tr(),
                            style: AppStyles.medium16blue.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.bluePrimaryColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * .001),

                      /// Login button
                      CustomElevatedButton(
                        onPressed: login,
                        buttonText: Text(
                          "Login".tr(),
                          style: AppStyles.bold20white,
                        ),
                      ),
                      SizedBox(height: screenHeight * .02),

                      /// Create account row
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
                              Navigator.pushNamed(
                                context,
                                AppRoutes.registerRoute,
                              );
                            },
                            child: Text(
                              "Create Account".tr(),
                              style: AppStyles.medium16blue.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.bluePrimaryColor,
                              ),
                            ),
                          )
                        ],
                      ),

                      /// Divider with "Or"
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * .02,
                          horizontal: screenWidth * .05,
                        ),
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

                      /// Google login button
                      Container(
                        height: screenHeight * .075,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.bluePrimaryColor,
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.01,
                            horizontal: screenWidth * 0.02,
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: screenWidth * 0.14),
                              Image.asset(AppAssets.google_icon),
                              SizedBox(width: screenWidth * 0.01),
                              Text(
                                "Login With Google".tr(),
                                style: AppStyles.medium16blue
                                    .copyWith(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    if (formKey.currentState!.validate()) {
      print("login");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }
  }
}
