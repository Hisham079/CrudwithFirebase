import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_ease/utils/common/app_colors.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({super.key,required this.iconPath});
  String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.whiteColor, // Border color
            width: 2.0, // Border width
          ),
          borderRadius: BorderRadius.circular(10)),
      child: SvgPicture.asset(
        iconPath,
        width: 25,
        color: AppColors.whiteColor,
      ),
    );
  }
}
