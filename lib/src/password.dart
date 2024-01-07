import 'package:formz/formz.dart';

/// Validation errors for the [Password] [FormzInput].
enum PasswordValidationError {
  /// Generic empty error.
  empty('Passowrd is required'),

  /// Generic invalid error.
  invalid(
    '''Password must be at least 8 characters and contain at least one letter and number''',
  );

  const PasswordValidationError(this.msg);

  /// Error message to be displayed.
  final String msg;
}

/// {@template password}
/// Form input for an password input.
/// {@endtemplate}
class Password extends FormzInput<String, PasswordValidationError> {
  /// {@macro password}
  const Password.pure() : super.pure('');

  /// {@macro password}
  const Password.dirty([super.value = '']) : super.dirty();

  static final _passwordRegExp =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  @override
  PasswordValidationError? validator(String? value) {
    final password = value ?? '';
    if (password.isEmpty) {
      return PasswordValidationError.empty;
    }
    if (!_passwordRegExp.hasMatch(password)) {
      return PasswordValidationError.invalid;
    }
    return null;
  }
}
