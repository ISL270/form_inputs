import 'package:formz/formz.dart';

/// Validation errors for the [Email] [FormzInput].
enum EmailValidationError {
  /// Generic empty error.
  emailRequired('Email is required'),

  /// Generic invalid error.
  emailInvalid('Invalid email');

  const EmailValidationError(this.msg);

  /// Error message to be displayed.
  final String msg;
}

/// {@template email}
/// Form input for an email input.
/// {@endtemplate}
class EmailFZ extends FormzInput<String, EmailValidationError> {
  /// {@macro email}
  const EmailFZ.pure() : super.pure('');

  /// {@macro email}
  const EmailFZ.dirty(super.value) : super.dirty();

  static final RegExp _emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  @override
  EmailValidationError? validator(String email) {
    if (email.isEmpty) {
      return EmailValidationError.emailRequired;
    }
    if (!_emailRegExp.hasMatch(email)) {
      return EmailValidationError.emailInvalid;
    }
    return null;
  }
}
