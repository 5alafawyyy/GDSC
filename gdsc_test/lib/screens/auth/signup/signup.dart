import 'package:flutter/material.dart';
import 'package:gdsc_test/screens/auth/login/login.dart';

import '../../../resources/app_strings.dart';
import '../../../widgets/custom_form_text_field.dart';
import '../../../widgets/login_signup_footer.dart';
import '../../../widgets/login_signup_forget_header.dart';
import '../../../widgets/text_form_validators.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static String id = 'Signup page';
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(
          top: 100,
          left: 20,
          right: 20,
        ),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                      fontFamily: "Pacifico",
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  CustomTextFormField(
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(_emailFocusNode),
                    textInputAction: TextInputAction.next,
                    focusNode: _nameFocusNode,
                    labelText: 'Name',
                    keyboardType: TextInputType.name,
                    controller: _nameController,
                    validator: nameValidator,
                    autofillHints: const [AutofillHints.name],
                    prefixIcon: Icons.person,
                  ),
                  const SizedBox(
                    height: 15.5,
                  ),
                  CustomTextFormField(
                    onEditingComplete: () => FocusScope.of(context)
                        .requestFocus(_mobileNumberFocusNode),
                    textInputAction: TextInputAction.next,
                    focusNode: _emailFocusNode,
                    labelText: 'Your Email',
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    validator: emailValidator,
                    autofillHints: const [AutofillHints.email],
                    prefixIcon: Icons.email,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  CustomTextFormField(
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(_addressFocusNode),
                    textInputAction: TextInputAction.next,
                    focusNode: _mobileNumberFocusNode,
                    labelText: 'Mobile No',
                    keyboardType: TextInputType.phone,
                    controller: _mobileNumberController,
                    validator: mobileNumberValidator,
                    autofillHints: const [
                      AutofillHints.telephoneNumberNational
                    ],
                    prefixIcon: Icons.phone,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  CustomTextFormField(
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(_passwordFocusNode),
                    textInputAction: TextInputAction.next,
                    focusNode: _addressFocusNode,
                    labelText: 'Address',
                    keyboardType: TextInputType.streetAddress,
                    controller: _addressController,
                    validator: addressValidator,
                    autofillHints: const [AutofillHints.addressCity],
                    prefixIcon: Icons.location_city,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  CustomTextFormField(
                    onEditingComplete: _formValidate,
                    textInputAction: TextInputAction.done,
                    focusNode: _passwordFocusNode,
                    labelText: 'Password',
                    keyboardType: TextInputType.visiblePassword,
                    controller: _passwordController,
                    validator: passwordValidator,
                    obscureText: _passwordVisiblityOff,
                    suffixIcon: suffix,
                    onSuffixIconButtonPressed: _showPassword,
                    autofillHints: const [AutofillHints.password],
                    prefixIcon: Icons.password,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: ElevatedButton(
                      onPressed: _formValidate,
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Colors.black,
                        ),
                        foregroundColor: MaterialStatePropertyAll(
                          Colors.white,
                        ),
                      ),
                      child: Text(
                        "Sign Up".toUpperCase(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  LoginSignupFooter(
                    question: 'Already hava an account?',
                    actionText: "Login",
                    onTap: () {
                      Navigator.restorablePushReplacementNamed(
                        context,
                        LoginScreen.id,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _mobileNumberFocusNode = FocusNode();
  final FocusNode _addressFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  bool _passwordVisiblityOff = true;
  IconData suffix = Icons.visibility_off_outlined;
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _mobileNumberController.dispose();
    _addressController.dispose();
    _passwordController.dispose();

    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _mobileNumberFocusNode.dispose();
    _addressFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _showPassword() {
    setState(() {
      _passwordVisiblityOff = !_passwordVisiblityOff;
      suffix = _passwordVisiblityOff
          ? Icons.visibility_off_outlined
          : Icons.visibility_outlined;
    });
  }

  void _formValidate() async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {}
  }
}
