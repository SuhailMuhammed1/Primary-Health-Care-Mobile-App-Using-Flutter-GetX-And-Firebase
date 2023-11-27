import 'package:flutter/material.dart';
import 'package:phc_lab/core/app_export.dart';

// ignore: must_be_immutable
class AppbarSubtitle extends StatelessWidget {
  AppbarSubtitle({
    Key? key,
    required this.text,
    this.textStyle = const TextStyle(),
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String text;

  final TextStyle textStyle;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          text,
          style: CustomTextStyles.titleMediumBold.copyWith(
            color: theme.colorScheme.onPrimary,
          ).merge(textStyle),
        ),
      ),
    );
  }
}
