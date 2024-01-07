import 'package:formz/formz.dart';

/// Validation errors for the [Name] [FormzInput].
enum NameValidationError {
  /// Name can't be empty.
  empty('First name is required'),
  /// Name can't exceed 50 characters.
  exceeds50char('Must not exceed 50 characters'),
  /// Name can't contain numbers or special characters.
  containsSpecialChar('Must contain letters only');

  const NameValidationError(this.msg);

  /// Error message to be displayed.
  final String msg;
}

/// {@template name}
/// Form input for an name input.
/// {@endtemplate}
class Name extends FormzInput<String, NameValidationError> {
  /// {@macro name}
  const Name.pure() : super.pure('');

  /// {@macro name}
  const Name.dirty([super.value = '']) : super.dirty();

  static final RegExp _nameRegExp = RegExp(r'^[\p{L}]+$', unicode: true);

  @override
  NameValidationError? validator(String? value) {
    final name = value ?? '';
    if (name.isEmpty) {
      return NameValidationError.empty;
    }
    if (name.length > 50) {
      return NameValidationError.exceeds50char;
    }
    if (!_nameRegExp.hasMatch(name)) {
      return NameValidationError.containsSpecialChar;
    }

    return null;
  }
}
