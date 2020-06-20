import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  Future<SharedPreferences> get prefs async => await SharedPreferences.getInstance();


  void getAccountList() {

  }

}
