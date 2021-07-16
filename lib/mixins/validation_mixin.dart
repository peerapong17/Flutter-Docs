class ValidationMixin {
  RegExp emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  String? checkPassword(String? value) {
    //return null if valid
    if (value == null || value.isEmpty) {
      return "Please Enter Password";
    }
    if (value.length < 6) {
      return "Password must be at least 4 characters";
    }

    return null;
  }

  String? checkEmail(String? value) {
    //return null if valid
    if (value == null || value.isEmpty) {
      return "Please Enter Email";
    }
    if (!emailValid.hasMatch(value)) {
      return "Please Enter a valid Email";
    }

    return null;
  }
}
