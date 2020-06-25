import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

class PinInput extends StatelessWidget {
  final ValueChanged<bool> onPinValidated;

  PinInput({this.onPinValidated});

  final BoxDecoration _pinPutDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    border: Border.all(color: Colors.grey),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PinPut(
          fieldsCount: 4,
          obscureText: '●',
          pinAnimationType: PinAnimationType.scale,
          onSubmit: (String pin) => validatePin(pin).then((isValid) => onPinValidated(isValid)),
          submittedFieldDecoration: _pinPutDecoration,
          selectedFieldDecoration: _pinPutDecoration.copyWith(
            border: Border.all(color: Colors.teal),
          ),
          followingFieldDecoration: _pinPutDecoration,
        ),
      ],
    );
  }

  Future<bool> validatePin(String pin) {
    String TEST_PIN_VALUE = "1111";
    return Future.value(pin == TEST_PIN_VALUE);
  }
}
