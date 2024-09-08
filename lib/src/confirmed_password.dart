import 'package:formz/formz.dart';

/// Validation errors for the [confirmPassword] [FormzInput].
enum ConfirmPasswordValidationError {
  /// Generic empty error.
  confirmPasswordRequired('Please re-enter your password for confirmation'),

  /// Generic invalid error.
  passwordsDoNotMatch('Passwords do not match');

  const ConfirmPasswordValidationError(this.msg);

  /// Error message to be displayed.
  final String msg;
}

/// {@template confirm_password}
/// Form input for a confirm password input.
/// {@endtemplate}
class ConfirmPassword extends FormzInput<String, ConfirmPasswordValidationError> {
  /// {@macro confirm_password}
  const ConfirmPassword.pure({this.password = ''}) : super.pure('');

  /// {@macro confirm_password}
  const ConfirmPassword.dirty({
    required this.password,
    required String value,
  }) : super.dirty(value);

  /// The original password.
  final String password;

  @override
  ConfirmPasswordValidationError? validator(String confirmationPassword) {
    if (confirmationPassword.isEmpty) {
      return ConfirmPasswordValidationError.confirmPasswordRequired;
    }
    if (password != confirmationPassword) {
      return ConfirmPasswordValidationError.passwordsDoNotMatch;
    }
    return null;
  }
}
