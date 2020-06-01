class ValidatorMixin {

  String validateEmail(String value) {
    if (value.isEmpty ||
        !RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
            .hasMatch(value)) {
      return 'Invalid Email';
    }
    
    return null;
    }

  String validatePassword(String value) {
    if (value.length < 4) {
      return 'Password must be atleast 4 characters';
    }

    return null;
  }
}
