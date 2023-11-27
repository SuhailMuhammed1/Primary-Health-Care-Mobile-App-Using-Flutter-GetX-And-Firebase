import 'package:flutter/material.dart';
import 'package:phc_lab/core/app_export.dart';

// ignore: must_be_immutable
class CategoriesItemWidget extends StatelessWidget {
  final String imagePath1;
  final String text1;
  final VoidCallback onTap;

  CategoriesItemWidget({
    required this.imagePath1,
    required this.text1,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.h,
      child: Padding(
        padding: EdgeInsets.only(bottom: 1.v),
        child: Column(
          children: [
            Container(
              height: 150.v,
              width: 150.h,
              padding: EdgeInsets.symmetric(
                horizontal: 10.h,
                vertical: 10.v,
              ),
              decoration: AppDecoration.fillOnErrorContainer.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder8,
              ),
              child: CustomImageView(
                imagePath: imagePath1,
                height: 120.adaptSize,
                width: 120.adaptSize,
                alignment: Alignment.center,
                onTap: onTap,
              ),
            ),
            SizedBox(height: 9.v),
            Text(
              text1,
              style: CustomTextStyles.titleSmallGray500,
            ),
          ],
        ),
      ),
    );
  }
}
