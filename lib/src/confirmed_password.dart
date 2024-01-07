import 'package:formz/formz.dart';

/// Validation errors for the [ConfirmedPassword] [FormzInput].
enum ConfirmedPasswordValidationError {
  /// Generic empty error.
  empty('Please enter the password again'),

  /// Generic invalid error.
  passwordsDoNotMatch('Passwords do not match');

  const ConfirmedPasswordValidationError(this.msg);

  /// Error message to be displayed.
  final String msg;
}

/// {@template confirmed_password}
/// Form input for a confirmed password input.
/// {@endtemplate}
class ConfirmedPassword
    extends FormzInput<String, ConfirmedPasswordValidationError> {
  /// {@macro confirmed_password}
  const ConfirmedPassword.pure({this.password = ''}) : super.pure('');

  /// {@macro confirmed_password}
  const ConfirmedPassword.dirty({required this.password, String value = ''})
      : super.dirty(value);

  /// The original password.
  final String password;

  @override
  ConfirmedPasswordValidationError? validator(String? value) {
    final confirmationPassword = value ?? '';
    if (confirmationPassword.isEmpty) {
      return ConfirmedPasswordValidationError.empty;
    }
    if (password != confirmationPassword) {
      return ConfirmedPasswordValidationError.passwordsDoNotMatch;
    }
    return null;
  }
}
