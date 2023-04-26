import 'package:flutter/material.dart';

import '../../../resources/app_strings.dart';
import '../../../widgets/custom_form_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String id = 'login page';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey();

  String? email, password;

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
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 150,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Log in',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                    fontFamily: "Pacifico",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  padding: const EdgeInsets.only(
                    bottom: 10,
                  ),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 2.0, // Underline thickness
                      ),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Welcome to our app',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        // decoration: TextDecoration.underline,
                        // decorationThickness: 2,
                        // decorationStyle: TextDecorationStyle.solid,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  onEditingComplete: () =>
                      FocusScope.of(context).requestFocus(_passwordFocusNode),
                  textInputAction: TextInputAction.next,
                  focusNode: _emailFocusNode,
                  labelText: AppStrings.yourEmail,
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  validator: emailValidator,
                  autofillHints: const [AutofillHints.email],
                  prefixIcon: Icons.email,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  onEditingComplete: _formValidate,
                  textInputAction: TextInputAction.done,
                  focusNode: _passwordFocusNode,
                  labelText: AppStrings.password,
                  keyboardType: TextInputType.visiblePassword,
                  controller: _passwordController,
                  validator: passwordValidator,
                  obscureText: _passwordVisiblityOff,
                  suffixIcon: _passwordVisiblityOff
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  onSuffixIconButtonPressed: _showPassword,
                  autofillHints: const [AutofillHints.password],
                  prefixIcon: Icons.lock,
                ),
                const SizedBox(
                  height: 20,
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
                      AppStrings.login.toUpperCase(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Dont\'t have an account?',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.pushNamed(context, RegisterPage.id);
                      },
                      child: const Text(
                        '  Register Now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();

  final FocusNode _passwordFocusNode = FocusNode();

  bool _passwordVisiblityOff = true;

  @override
  void initState() {
    _passwordVisiblityOff = true;
    super.initState();
  }

  void _formValidate() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {}
  }

  void _showPassword() {
    setState(() {
      _passwordVisiblityOff = !_passwordVisiblityOff;
    });
  }
}

String? emailValidator(value) {
  if (value!.isEmpty) {
    return AppStrings.emailAddressCanNotBeEmpty;
  } else if (!RegExp(AppStrings.emailAddressRegularExpression)
      .hasMatch(value)) {
    return AppStrings.enterCorrectEmailAddress;
  } else {
    return null;
  }
}

String? passwordValidator(value) {
  if (value!.isEmpty) {
    return AppStrings.passwordCanNotBeEmpty;
  } else if (value.length < 8) {
    return AppStrings.passwordCanNotBeLessThan_8Characters;
  } else {
    return null;
  }
}
