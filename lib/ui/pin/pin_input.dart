import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

class PinInput extends StatefulWidget {
  final Function onPinValidated;

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
          validator: (val) => _validate || val.length < 4 ? '' : 'Wrong pin',
          onSubmit: (String value) {
            if (validatePin(value)) {
              FocusScope.of(context).unfocus();
              widget.onPinValidated.call();
            }
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
