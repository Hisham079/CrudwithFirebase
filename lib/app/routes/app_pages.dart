import 'package:get/get.dart';
import 'package:test_ease/app/modules/auth/bindings/auth_bindings.dart';
import 'package:test_ease/app/modules/auth/view/login_view.dart';
import 'package:test_ease/app/modules/auth/view/signup_view.dart';
import 'package:test_ease/app/modules/auth/view/splash_screen.dart';
import 'package:test_ease/app/modules/home/home_bindings/home_bindings.dart';
import 'package:test_ease/app/modules/home/view/home_viewe.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashScreen(),
      // binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
