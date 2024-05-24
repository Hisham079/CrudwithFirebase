import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_ease/utils/common/app_colors.dart';

class SocialButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final double horizontalPadding;
  const SocialButton({
    Key? key,
    required this.iconPath,
    required this.label,
    this.horizontalPadding = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: SvgPicture.asset(
        iconPath,
        width: 25,
        color: AppColors.whiteColor,
      ),
      label: Text(
        label,
        style: const TextStyle(
          color: AppColors.whiteColor,
          fontSize: 17,
        ),
      ),
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: horizontalPadding),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: AppColors.borderColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}