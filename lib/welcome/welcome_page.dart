import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keykeeper/pin/pin_input.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool _showContainer = false;
  bool _showPinInput = false;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () => setState(() => _showContainer = true));
    Future.delayed(Duration(seconds: 2), () => setState(() => _showPinInput = true));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 500),
          opacity: _showContainer ? 1 : 0,
          child: Column(
            children: <Widget>[
              Spacer(flex: 3),
              Image.asset('assets/images/lock.png', scale: 5),
//            Lottie.asset('assets/anims/lock_anim_light.json', repeat: true),
              Spacer(),
              AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: _showPinInput ? 1 : 0,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: PinInput(onPinValidated: (isValid) {
                        print(isValid.toString());
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("Enter pin"),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Key keeper", style: TextStyle(color: Colors.grey[600])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
