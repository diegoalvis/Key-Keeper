import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthenticationService {
  final _localAuthentication = LocalAuthentication();

  bool isAuthenticated = false;

  Future<bool> isBiometricAvailable() async {
    _getListOfBiometricTypes();
    bool isAvailable = false;
    try {
      isAvailable = await _localAuthentication.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }

    isAvailable ? print('Biometric is available!') : print('Biometric is unavailable.');

    return isAvailable;
  }

  Future<void> _getListOfBiometricTypes() async {
    List<BiometricType> listOfBiometrics;
    try {
      listOfBiometrics = await _localAuthentication.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    print(listOfBiometrics);
  }

  Future<bool> authenticate() async {
    try {
      isAuthenticated = await _localAuthentication.authenticateWithBiometrics(
        localizedReason: 'Authenticate to access',
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } on PlatformException catch (e) {
      print(e);
    }
    return isAuthenticated;
  }
}
