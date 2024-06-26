import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:test_ease/app/modules/auth/controllers/auth_controller.dart';
import 'package:test_ease/app/modules/auth/view/signup_view.dart';
import 'package:test_ease/app/modules/home/view/home_viewe.dart';

class SplashScreen extends GetView<AuthController> {
   final controller = Get.put(AuthController());
  SplashScreen({super.key});

  @override
  
  Widget build(BuildContext context) {
   
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      controller.checkAuthState();
    });
    return  AnimatedSplashScreen(splash: SizedBox(
            height: 150,
            width: 150,
            child: Icon(Icons.abc)),
        splashIconSize: 250,
        backgroundColor: Colors.white,
        splashTransition: SplashTransition.fadeTransition,
        duration: 100,
        animationDuration: Duration(seconds: 2),
         nextScreen:controller.nextPage.value? SignupView():HomeView());
    
  }
}
