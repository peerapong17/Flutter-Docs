class ValidationMixin {
  String? checkEmail(value) {
    //return null if valid
    if (value == null || value.isEmpty) {
      return "Please Enter Email";
    }
    if (!value.contains('@')) {
      return "Please Enter a Valid Email";
    }
    return null;
  }

  String? checkPassword(String? value) {
    //return null if valid
    if (value == null || value.isEmpty) {
      return "Please Enter Password";
    }
    if (value.length < 4) {
      return "Password must be at least 4 characters";
    }

    return null;
  }
}
