import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

class PinInput extends StatefulWidget {
  final ValueChanged<bool> onPinValidated;

  PinInput({this.onPinValidated});

  @override
  _PinInputState createState() => _PinInputState();
}

class _PinInputState extends State<PinInput> {
  final _controller = TextEditingController();
  bool _validate = true;

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
          autoValidate: true,
          validator: (val) => _validate || val.length < 4 ? '' : 'Wrong ui.pin',
          onSubmit: (String value) {
            FocusScope.of(context).unfocus();
            widget.onPinValidated(validatePin(value));
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

  bool validatePin(String pin) {
    String TEST_PIN_VALUE = "1111";
    final isValid = pin == TEST_PIN_VALUE;
    setState(() => _validate = isValid);
    return isValid;
  }
}
