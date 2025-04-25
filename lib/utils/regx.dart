class RegX{
  static bool isEmailValid(String email) {
    return RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(email);
  }

  static bool isNameValid(String name) {
    return RegExp(r"^[A-Za-z]+(?: [A-Za-z]+)*$").hasMatch(name);
  }

  static bool isPasswordValid(String password) {
    return RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
    ).hasMatch(password);
  }

  static bool isNumberValid(String number) {
    return RegExp(r'^[0-9]+$').hasMatch(number);
  }
}