class AppStrings {
  // Validation Phrases
  static const String emailAddressCanNotBeEmpty =
      'Please enter your email address';
  static const String enterCorrectEmailAddress = 'Enter Correct Email Address';
  static const String passwordCanNotBeEmpty = 'Please enter your password';
  static const String passwordCanNotBeLessThan_8Characters =
      'Password Can\'t Be Less Than 8 Characters!';
  static const String enterCorrectName = 'Enter Correct Name';
  static const String enterCorrectMobileNumber = 'Enter Correct Mobile Number';
  static const String nameCanNotBeEmpty = 'Name Can\'t Be Empty';
  static const String mobileNumberCanNotBeEmpty =
      'Mobile Number Can\'t Be Empty';
  static const String addressCanNotBeEmpty = 'Address Can\'t Be Empty';

  // Regular Expressions
  static const String emailAddressRegularExpression =
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  static const String mobileNumberRegularExpression =
      r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
  static const String nameRegularExpression = r'^[a-z A-Z]+$';
}
