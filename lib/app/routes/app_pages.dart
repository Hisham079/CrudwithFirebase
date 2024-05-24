import 'package:get/get.dart';
import 'package:test_ease/app/modules/auth/bindings/auth_bindings.dart';
import 'package:test_ease/app/modules/auth/login_view.dart';
import 'package:test_ease/app/modules/auth/signup_view.dart';
import 'package:test_ease/app/modules/auth/splash_screen.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () =>  HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () =>  SplashScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () =>  SignupView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () =>  LoginView(),
      binding: AuthBinding(),
    ),
  ];
}
