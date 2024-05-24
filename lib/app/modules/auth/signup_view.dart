import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ease/app/modules/auth/components/custom_icon.dart';
import 'package:test_ease/app/modules/auth/controllers/auth_controller.dart';
import 'package:test_ease/utils/common/app_colors.dart';
import 'package:test_ease/utils/common/app_text_style.dart';
import 'package:test_ease/utils/common/custom_field.dart';
import 'package:test_ease/utils/common/gradial_button.dart';
import 'package:test_ease/utils/common/space.dart';

class SignupView extends GetView<AuthController> {
  SignupView({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset('assets/images/signin_balls.png'),
              const Text(
                'Sign up',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              verticalSpace(30),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Create your Account',
                  style: AppTextStyle.popin15W400
                      .copyWith(color: AppColors.whiteColor),
                ),
              ).paddingOnly(left: 10),

              const SizedBox(height: 15),
              CustomField(controller: _emailController, hintText: 'Email'),
              const SizedBox(height: 15),
              //  CustomField(hintText: 'Username'),
              // const SizedBox(height: 15),
              CustomField(
                  controller: _passwordController, hintText: 'Password'),
              const SizedBox(height: 20),
              Obx(() => GradientButton(
                    title: !controller.registerLoading.value
                        ? Text(
                            'Sign up',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                                color: Theme.of(context).primaryColorLight),
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
                    onPressed: () {
                      controller.register(
                          _emailController.text, _passwordController.text);
                    },
                  )),
              const SizedBox(height: 20),

              Text('- Or sign in with -'),
              verticalSpace(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIconButton(
                    iconPath: 'assets/svgs/g_logo.svg',
                  ),
                  horizontalSpace(20),
                  CustomIconButton(
                    iconPath: 'assets/svgs/f_logo.svg',
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
