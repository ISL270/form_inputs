import 'package:dartx/dartx.dart';
import 'package:formz/formz.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart' as pn_parser;

enum PhoneNumberValidationError {
  phoneNumberRequired('Phone number is required'),

  phoneNumberInvalid('Invalid phone number');

  const PhoneNumberValidationError(this.msg);

  final String msg;
}

// Extend FormzInput and provide the input type and error type.
class PhoneNumber extends FormzInput<String, PhoneNumberValidationError> {
  // Call super.pure to represent an unmodified form input.
  const PhoneNumber.pure([this.isoCode = pn_parser.IsoCode.EG]) : super.pure('');

  // Call super.dirty to represent a modified form input.
  const PhoneNumber.dirty(super.value, [this.isoCode = pn_parser.IsoCode.EG]) : super.dirty();

  final pn_parser.IsoCode isoCode;

  // Override validator to handle validating a given input value.
  @override
  PhoneNumberValidationError? validator(String phoneNum) {
    if (phoneNum.isBlank) {
      return PhoneNumberValidationError.phoneNumberRequired;
    }
    final parsedPhoneNum = pn_parser.PhoneNumber.parse(
      phoneNum,
      callerCountry: isoCode,
      destinationCountry: isoCode,
    );
    if (!parsedPhoneNum.isValid()) {
      return PhoneNumberValidationError.phoneNumberInvalid;
    }
    return null;
  }
}
