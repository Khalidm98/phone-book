abstract class Validators {
  static String? emptyValue(String? value) {
    if (value == null || value.isEmpty) return 'This field cannot be empty!';
    return null;
  }

  static String? name(String? value) {
    if (value == null || value.isEmpty) return 'Name cannot be empty!';
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.isEmpty) return 'Phone cannot be empty!';
    return null;
  }
}
