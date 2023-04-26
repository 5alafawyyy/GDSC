import 'package:flutter/material.dart';

class LoginSignupForgotHeader extends StatelessWidget {
  const LoginSignupForgotHeader({
    super.key,
    required this.title,
    required this.subTitle,
    required this.titleTextStyle,
    required this.subTitleTextStyle,
  });

  final String title;
  final String subTitle;
  final TextStyle? titleTextStyle;
  final TextStyle? subTitleTextStyle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: titleTextStyle ?? Theme.of(context).textTheme.displayLarge,
          textAlign: TextAlign.center,
        ),
        Text(
          subTitle,
          style: subTitleTextStyle ?? Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 30.0,
        ),
      ],
    );
  }
}
