import 'dart:convert';

import 'package:keykeeper/storage/account_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  static const String _KEY_ACCOUNTS = 'key_accounts';

  Future<SharedPreferences> get prefs async => await SharedPreferences.getInstance();

  Future<List<String>> getAccountList() async {
    final pref = await prefs;
    return pref.getStringList(_KEY_ACCOUNTS)?.map((e) => json.decode(e));
  }

  Future saveAccount(AccountModel account) async {
    final accountList = await getAccountList() ?? List<String>();
    accountList.add(json.encode(accountList));
  }
}
