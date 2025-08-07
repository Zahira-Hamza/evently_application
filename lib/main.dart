import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/providers/app_language_provider.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/ui/authentication/forgetPassword_screen.dart';
import 'package:evently_app/ui/authentication/login/login_screen.dart';
import 'package:evently_app/ui/authentication/register_screen.dart';
import 'package:evently_app/ui/events/add_event.dart';
import 'package:evently_app/ui/home/tabs/home/home_screen.dart';
import 'package:evently_app/ui/home/tabs/home/home_screen_b.dart';
import 'package:evently_app/ui/home/tabs/love/love_tab_screen.dart';
import 'package:evently_app/ui/home/tabs/map/map_tab_screen.dart';
import 'package:evently_app/ui/home/tabs/profile/profile_tab_screen.dart';
import 'package:evently_app/ui/onboarding/onboarding_screen.dart';
import 'package:evently_app/ui/onboarding/welcome_screen.dart';
import 'package:evently_app/utils/app_routes.dart';
import 'package:evently_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: Locale('en'), //defult language
        child: MultiProvider(providers: [
          ChangeNotifierProvider(create: (_) => AppLanguageProvider()),
          ChangeNotifierProvider(create: (_) => AppThemeProvider()),
        ], child: MyApp())),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      ///localization
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      ///theming
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      //themeMode: ThemeMode.dark,
      themeMode: themeProvider.appTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.welcomeRoute,
      // initialRoute: AppRoutes.homeRoute,
      routes: {
        AppRoutes.welcomeRoute: (context) => const WelcomeScreen(),
        AppRoutes.homeRoute: (context) => HomeScreen(),
        AppRoutes.homeRouteB: (context) => HomeScreenB(),
        AppRoutes.introRoute: (context) => const OnboardingScreen(),
        AppRoutes.loginRoute: (context) => const LoginScreen(),
        AppRoutes.registerRoute: (context) => const RegisterScreen(),
        AppRoutes.forgotPasswordRoute: (context) =>
            const ForgetpasswordScreen(),

        // AppRoutes.registerRoute: (context) => const RegisterScreen(),
        // AppRoutes.forgotPasswordRoute: (context) => const ForgotPasswordScreen(),
        AppRoutes.profileRoute: (context) => const ProfileTabScreen(),
        AppRoutes.mapRoute: (context) => const MapTabScreen(),
        AppRoutes.loveRoute: (context) => const LoveTabScreen(),
        AppRoutes.addEventRoute: (context) => AddEvent(),
      },
    );
  }
}
