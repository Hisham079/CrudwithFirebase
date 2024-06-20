import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ease/app/modules/auth/controllers/auth_controller.dart';
import 'package:test_ease/utils/common/app_colors.dart';
import 'package:test_ease/utils/common/app_text_style.dart';
import 'package:test_ease/utils/common/custom_field.dart';
import 'package:test_ease/utils/common/custom_button.dart';
import 'package:test_ease/utils/common/space.dart';

class LoginView extends GetView<AuthController> {
  LoginView({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: const Text('Login'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign in',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: AppColors.blueColor),
              ),
              verticalSpace(10),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Login to your Account',
                  style: AppTextStyle.popin15W400
                      .copyWith(color: AppColors.whiteColor),
                ),
              ).paddingOnly(left: 10),
              const SizedBox(height: 15),
              CustomField(
                hintText: 'Email',
                controller: _emailController,
              ),
              CustomField(
                hintText: 'Password',
                controller: _passwordController,
              ),
              const SizedBox(height: 20),
              Obx(() => CustomButton(
                  title: !controller.signinLoading.value
                      ? const Text(
                          'Sign in',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                              color: AppColors.whiteColor),
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
                  onPressed: () {
                    controller.signIn(
                        _emailController.text, _passwordController.text);
                  })),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                      onPressed: () => Get.toNamed('/signup'),
                      child: const Text('Sign up'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
