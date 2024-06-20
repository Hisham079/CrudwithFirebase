import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ease/app/services/auth_services.dart';
import 'package:test_ease/app/sharedpreference/app_sharedpreferences.dart';

class AuthController extends GetxController {
  var nextPage = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> _user = Rxn<User>();

  User? get user => _user.value;
  final AuthService _authService = AuthService();
  var registerLoading = false.obs;
  var signinLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_authService.auth.authStateChanges());
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      checkAuthState();
    });
  }

  String get userId => _user.value?.uid ?? '';

  void checkAuthState() async {
    if (_auth.currentUser != null) {
      // User is signed in, navigate to home screen
      Get.offNamed('/home');
      nextPage(true);
    } else {
      // User is not signed in, navigate to sign-in screen
      Get.offNamed('/signin');
      nextPage(false);
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      signinLoading(true);
      User? user =
          await _authService.signInWithEmailAndPassword(email, password);
      signinLoading(false);
      if (user != null) {
        Get.offNamed('/home');
        Get.snackbar('Success', 'Login Success');
      }
      //  else {
      //   signinLoading(false);
      //   Get.snackbar('Error', 'Login Failed');
      // }
    } on FirebaseAuthException catch (e) {
      signinLoading(false);
      String errorMessage;
      switch (e.code) {
        case 'invalid-email':
          errorMessage = 'The email address is not valid.';
          break;
        case 'user-disabled':
          errorMessage = 'This user has been disabled.';
          break;
        case 'user-not-found':
          errorMessage = 'No user found for that email.';
          break;
        case 'wrong-password':
          errorMessage = 'Wrong password provided for that user.';
          break;
        default:
          errorMessage = 'An unknown error occurred. Please try again.';
          signinLoading(false);
          throw 'An unknown error occurred. Please try again.';
      }
      signinLoading(false);
      Get.snackbar('Error', errorMessage, snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      print(e);
      signinLoading(false);
      Get.snackbar('Error', 'An unknown error occurred. Please try again.',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> register(String email, String password) async {
    try {
      registerLoading(true);
      User? user =
          await _authService.registerWithEmailAndPassword(email, password);

      if (user != null) {
        Get.offNamed('/signin');
        Get.snackbar('Success', 'Registration Success');
      } else {
        Get.snackbar('Error', 'Registration failed');
      }
      registerLoading(false);
    } catch (e) {
      Get.snackbar('Error', e.toString());
      registerLoading(false);
    }
  }

  Future<void> signOut() async {
    try {
      await _authService.signOut();
      Get.offAllNamed('/signin');
    } catch (e) {
      print('Error Signing out :$e');
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
