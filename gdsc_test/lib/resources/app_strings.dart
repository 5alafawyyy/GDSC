class AppStrings {
  static const String login = 'Login';

  // Login Screen
  static const String yourEmail = 'Your Email';
  static const String password = 'Password';

  // Validation Phrases
  static const String emailAddressCanNotBeEmpty =
      'Please enter your email address';
  static const String enterCorrectEmailAddress = 'Enter Correct Email Address';
  static const String passwordCanNotBeEmpty = 'Please enter your password';
  static const String passwordCanNotBeLessThan_8Characters =
      'Password Can\'t Be Less Than 8 Characters!';

  // Regular Expressions
  static const String emailAddressRegularExpression =
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
}
