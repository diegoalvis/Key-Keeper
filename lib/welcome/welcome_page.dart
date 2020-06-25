import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keykeeper/pin/pin_input.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Spacer(flex: 3),
            Image.asset('assets/images/lock.png', scale: 5),
            Spacer(),
            Padding(padding: const EdgeInsets.all(48.0), child: PinInput(
              onPinValidated: (isValid) {
                print(isValid.toString());
              },
            )),
            Spacer(),
            Padding(padding: const EdgeInsets.all(16.0), child: Text("Key keeper")),
          ],
        ),
      ),
    );
  }
}
