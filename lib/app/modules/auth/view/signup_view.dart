import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ease/app/modules/auth/controllers/auth_controller.dart';
import 'package:test_ease/utils/common/app_colors.dart';
import 'package:test_ease/utils/common/app_text_style.dart';
import 'package:test_ease/utils/common/custom_field.dart';
import 'package:test_ease/utils/common/custom_button.dart';
import 'package:test_ease/utils/helper/helper.dart';
import 'package:test_ease/utils/common/space.dart';

class SignupView extends GetView<AuthController> {
  SignupView({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: const Text('Signup'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sign up',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: AppColors.blueColor),
                ),
                verticalSpace(10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Create your Account',
                    style: AppTextStyle.popin15W400
                        .copyWith(color: AppColors.whiteColor),
                  ),
                ).paddingOnly(left: 10),
                verticalSpace(15),
                CustomField(
                  controller: _emailController,
                  hintText: 'Email',
                  validator: (p0) => validatEmpty(p0),
                ),
                verticalSpace(15),
                CustomField(
                  controller: _passwordController,
                  hintText: 'Password',
                  obscureText: true,
                  validator: (p0) => validatePassword(p0),
                ),
                const SizedBox(height: 20),
                Obx(() => CustomButton(
                      title: !controller.registerLoading.value
                          ? Text(
                              'Sign up',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  color: Theme.of(context).primaryColorLight),
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controller.register(
                              _emailController.text, _passwordController.text);
                        }
                      },
                    )),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
