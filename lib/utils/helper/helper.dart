//New

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a value';
  }
  if (!isEmailValid(value)) {
    return 'Please enter a valid email';
  }
  return null;
}

String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a value';
  }
  if (!nameLengthLimit(value)) {
    return 'Please enter a valid name';
  }
  return null;
}

String? validatEmpty(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a value';
  }
  return null;
}

String? validatDuration(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter expected duration';
  }
  if (int.tryParse(value) == null) {
    return 'Please enter a valid number';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a value';
  }
  if (!hasMinLength(value)) {
    return 'Password must be at least 8 charactors';
  }
  if (!hasUppercase(value)) {
    return 'Password must contain at least one uppercase letter';
  }
  if (!hasLowercase(value)) {
    return 'Password must contain at least one lowercase letter';
  }
  if (!hasNumber(value)) {
    return 'Password must containat at least one number';
  }
  if (!hasSpecialCharacter(value)) {
    return 'Password must contain at least one special character';
  }
  return null;
}

String? validateEmpty(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a value';
  }
  return null;
}

bool isPasswordValid(String password) {
  if (password.length < 8) {
    return false;
  }

  // Check if the password contains at least one uppercase letter
  if (!password.contains(RegExp(r'[A-Z]'))) {
    return false;
  }

  // Check if the password contains at least one lowercase letter
  if (!password.contains(RegExp(r'[a-z]'))) {
    return false;
  }

  // Check if the password contains at least one number
  if (!password.contains(RegExp(r'[0-9]'))) {
    return false;
  }

  // Check if the password contains at least one special character
  if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    return false;
  }

  return true;
}

//Email
bool isEmailValid(String email) {
  // Define a regular expression pattern for email validation
  final emailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  // Check if the email matches the regex pattern
  return emailRegex.hasMatch(email);
}

//Phone number
bool isPhoneNumberValid(String phoneNumber) {
  // Define a regular expression pattern for phone number validation
  final phoneRegex = RegExp(r'^\+[1-9]\d{1,14}$');

  return phoneRegex.hasMatch(phoneNumber);
}
// bool isValidCode(String phoneNumber) {
//   final countryCode = ['+1','+91','+44'];

//   for(String code in countryCode){
//     if(phoneNumber.startsWith(code)){
//       final phoneNumberWithoutCode = phoneNumber.substring(code.length);
//       return true;
//     }
//   }
//   return false;
// }

//PASSWORD
bool hasMinLength(String password) {
  return password.length >= 8;
}

bool hasUppercase(String password) {
  return password.contains(RegExp(r'[A-Z]'));
}

bool hasLowercase(String password) {
  return password.contains(RegExp(r'[a-z]'));
}

bool hasNumber(String password) {
  return password.contains(RegExp(r'[0-9]'));
}

bool hasSpecialCharacter(String password) {
  return password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
}

//Name
bool nameLengthLimit(String name) {
  return name.length > 2 && name.length <= 18;
}

//CANT BE NULL
