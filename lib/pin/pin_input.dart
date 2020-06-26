import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

class PinInput extends StatelessWidget {
  final ValueChanged<bool> onPinValidated;
  final _controller = TextEditingController();

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
          controller: _controller,
          textStyle: TextStyle(color: Colors.grey),
          pinAnimationType: PinAnimationType.scale,
          onSubmit: (String pin) {
            FocusScope.of(context).unfocus();
            validatePin(pin).then((isValid) {
              onPinValidated(isValid);
            });
          },
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
    final isValid = pin == TEST_PIN_VALUE;
    return Future.value(isValid);
  }
}
