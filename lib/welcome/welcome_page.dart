import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keykeeper/account_list/account_list_page.dart';
import 'package:keykeeper/pin/pin_input.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool _showContainer = false;
  bool _showPinInput = false;
  bool _showLoader = false;

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
              Spacer(flex: 2),
              Container(
                  height: 135,
                  width: 135,
                  child: _showLoader
                      ? Center(child: Platform.isAndroid ? Lottie.asset('assets/anims/lock_anim_light.json', repeat: true) : CupertinoActivityIndicator())
                      : Image.asset('assets/images/lock.png', scale: 6)),
              Spacer(),
              AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: _showPinInput ? 1 : 0,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100.0),
                      child: PinInput(onPinValidated: (isValid) async {
                        // TODO remove this
                        setState(() => _showLoader = true);
                        if (isValid) {
                          Navigator.pushReplacement(this.context, MaterialPageRoute(builder: (context) => AccountListPage()));
                        } else {
                          setState(() => _showLoader = false);
                        }
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
