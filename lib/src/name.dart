import 'package:dartx/dartx.dart';
import 'package:formz/formz.dart';

enum NameValidationError {
  nameRequired('Name is required'),

  nameLettersOnly('Name must contain letters only');

  const NameValidationError(this.msg);

  final String msg;
}

// Extend FormzInput and provide the input type and error type.
class NameFZ extends FormzInput<String, NameValidationError> {
  // Call super.pure to represent an unmodified form input.
  const NameFZ.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const NameFZ.dirty(super.value) : super.dirty();

  static final RegExp _nameRegExp = RegExp('[A-Za-zء-ي ]');

  // Override validator to handle validating a given input value.
  @override
  NameValidationError? validator(String name) {
    if (name.isBlank) {
      return NameValidationError.nameRequired;
    }
    if (!_nameRegExp.hasMatch(name)) {
      return NameValidationError.nameLettersOnly;
    }
    return null;
  }
}
