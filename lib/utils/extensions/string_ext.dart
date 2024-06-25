extension StringX on String {
  bool get emailValidator {
    final regExp = RegExp(r"^[^@]+@[^@]+\.[^@]+");
    return regExp.hasMatch(this);
  }
}
