import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bati_app/view/screens/auth_screens/login_screen.dart';
import 'package:bati_app/view/screens/home_page_screen/home_page_screen.dart';
import 'package:bati_app/view_model/data/local_data/shared_keys.dart';
import 'package:bati_app/view_model/data/local_data/shared_preferences.dart';
import 'package:bati_app/view_model/utils/images/app_images.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 3000,
        splash: AppImages.homeLogo,
        nextScreen: LocalData.get(key:SharedKeys.uid)!=null?const HomePageScreen():const LoginScreen(),
        splashIconSize: 300.0,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.white
    );
  }
}
