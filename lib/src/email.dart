import 'package:formz/formz.dart';

/// Validation errors for the [Email] [FormzInput].
enum EmailValidationError {
  /// Generic empty error.
  empty('Email is required'),

  /// Generic invalid error.
  invalid('Invalid email');

  const EmailValidationError(this.msg);

  /// Error message to be displayed.
  final String msg;
}

/// {@template email}
/// Form input for an email input.
/// {@endtemplate}
class Email extends FormzInput<String, EmailValidationError> {
  /// {@macro email}
  const Email.pure() : super.pure('');

  /// {@macro email}
  const Email.dirty([super.value = '']) : super.dirty();

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  EmailValidationError? validator(String? value) {
    final email = value ?? '';
    if (email.isEmpty) {
      return EmailValidationError.empty;
    }
    if (!_emailRegExp.hasMatch(email)) {
      return EmailValidationError.invalid;
    }
    return null;
  }
}
