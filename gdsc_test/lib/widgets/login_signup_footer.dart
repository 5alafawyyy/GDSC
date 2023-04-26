import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginSignupFooter extends StatelessWidget {
  const LoginSignupFooter({
    super.key,
    required this.question,
    required this.actionText,
    required this.onTap,
  });

  final String question;
  final String actionText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: question,
        style: Theme.of(context).textTheme.bodyLarge,
        children: [
          TextSpan(
            text: ' $actionText',
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 18.0,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
