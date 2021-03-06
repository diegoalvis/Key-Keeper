import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keykeeper/core/local_authentication_service.dart';
import 'package:keykeeper/ui/account_list/account_list_page.dart';
import 'package:keykeeper/ui/pin/pin_input.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool _showContainer = false;
  bool _showPinInput = false;
  bool _showLoader = false;
  bool _isBiometricAvailable = false;

  LocalAuthenticationService _authenticationService = LocalAuthenticationService();

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 1000), () => setState(() => _showContainer = true));
    Future.delayed(Duration(milliseconds: 1500), () => setState(() => _showPinInput = true));
    Future.delayed(Duration(milliseconds: 2000), () async {
      final isBiometricAvailable = await _authenticationService.isBiometricAvailable();
      setState(() => _isBiometricAvailable = isBiometricAvailable);
    });
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
              Spacer(),
              Expanded(
                child: Container(
                    height: 135,
                    width: 135,
                    child: _showLoader
                        ? Center(child: Platform.isAndroid ? Lottie.asset('assets/anims/lock_anim_light.json', repeat: false) : CupertinoActivityIndicator())
                        : Image.asset('assets/images/lock.png', scale: 6)),
              ),
              AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: _showPinInput ? 1 : 0,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100.0),
                      child: PinInput(onPinValidated: () {
                        navigateToHome(context);
                      }),
                    ),
                    Text("Enter pin"),
                  ],
                ),
              ),
              Expanded(
                child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 500),
                    child: _isBiometricAvailable
                        ? GestureDetector(
                            onTap: () async {
                              final isAuthenticated = await _authenticationService.authenticate();
                              if (isAuthenticated) {
                                navigateToHome(context);
                              }
                            },
                            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                              Icon(Icons.fingerprint, size: 60),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text("Enter with fingerprint"),
                              ),
                            ]))
                        : Spacer()),
              ),
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

  void navigateToHome(BuildContext context) async {
    setState(() => _showLoader = true);
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AccountListPage()));
  }
}
