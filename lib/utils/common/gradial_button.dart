import 'package:flutter/material.dart';
import 'package:test_ease/utils/common/app_colors.dart';

class GradientButton extends StatelessWidget {
  GradientButton({Key? key, required this.title, this.onPressed})
      : super(key: key);
  Widget title;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.blueColor,
        borderRadius: BorderRadius.circular(7),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(395, 55),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child:title
      ),
    );
  }
}
