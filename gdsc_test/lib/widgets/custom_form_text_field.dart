import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final void Function()? onEditingComplete;
  final void Function()? onTap;
  final void Function()? onSuffixIconButtonPressed;
  final String? Function(String?)? validator;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final Iterable<String>? autofillHints;
  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onTap,
    required this.focusNode,
    required this.textInputAction,
    this.onEditingComplete,
    this.suffixIcon,
    this.prefixIcon,
    this.onSuffixIconButtonPressed,
    this.autofillHints,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints: autofillHints,
      onEditingComplete: onEditingComplete,
      textInputAction: textInputAction,
      focusNode: focusNode,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: suffixIcon == null
            ? const SizedBox()
            : IconButton(
                onPressed: onSuffixIconButtonPressed,
                icon: Icon(
                  suffixIcon,
                  color: Colors.blue,
                ),
              ),
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.black,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      // isCollapsed: false,

      cursorColor: Colors.black,
      onTap: onTap,
    );
  }
}
