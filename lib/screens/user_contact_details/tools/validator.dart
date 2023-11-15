class Validator {
  static String? validateFirstName(String? value) {
    if(value == null || value.isEmpty) {
      return 'The "Name" field cannot be empty';
    }
  }

  static String? validateLastName(String? value) {
    if(value == null || value.isEmpty) {
      return 'The "Last name" field cannot be empty';
    }
  }

  static String? validatePhoneNumber(String? value) {
    if(value == null || value.isEmpty) {
      return 'The "Phone number" field cannot be empty';
    }
  }

  static String? validateAddress(String? value) {
    if(value == null || value.isEmpty) {
      return 'The "Address" field cannot be empty';
    }
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'The "Email" field cannot be empty';
    }
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Enter correct Email';
    }
    return null;
  }
}