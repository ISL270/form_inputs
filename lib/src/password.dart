import 'package:formz/formz.dart';

/// Validation errors for the [Password] [FormzInput].
enum PasswordValidationError {
  /// Generic empty error.
  passwordRequired('Passowrd is required'),

  /// Generic invalid error.
  passwordInvalid(
    '''Password must be at least 8 characters and contain at least one letter and number''',
  );

  const PasswordValidationError(this.msg);

  /// Error message to be displayed.
  final String msg;
}

/// {@template password}
/// Form input for an password input.
/// {@endtemplate}
class PasswordFZ extends FormzInput<String, PasswordValidationError> {
  /// {@macro password}
  const PasswordFZ.pure() : super.pure('');

  /// {@macro password}
  const PasswordFZ.dirty(super.value) : super.dirty();

  static final _passwordRegExp = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  @override
  PasswordValidationError? validator(String password) {
    if (password.isEmpty) {
      return PasswordValidationError.passwordRequired;
    }
    if (!_passwordRegExp.hasMatch(password)) {
      return PasswordValidationError.passwordInvalid;
    }
    return null;
  }
}
