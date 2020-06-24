import 'dart:convert';

import 'package:keykeeper/storage/account_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

// TODO inject
class PreferencesManager {
  static const String _KEY_ACCOUNTS = 'key_accounts';

  Future<SharedPreferences> get prefs async => await SharedPreferences.getInstance();

  Future<List<AccountModel>> getAccountList() async {
    final pref = await prefs;
    return pref.getStringList(_KEY_ACCOUNTS)?.map((e) => AccountModel.fromJson(json.decode(e)))?.toList();
  }

  Future saveAccount(AccountModel account) async {
    final accountList = await getAccountList() ?? List<AccountModel>();
    accountList.add(account);
    await _saveAccountList(accountList);
  }

  Future removeAccount(int index) async {
    final accountList = await getAccountList() ?? List<AccountModel>();
    accountList?.removeAt(index);
    await _saveAccountList(accountList);
  }

  Future _saveAccountList(List<AccountModel> accountList) async {
    final pref = await prefs;
    pref.setStringList(_KEY_ACCOUNTS, accountList.map((e) => json.encode(e.toJson())).toList());
  }
}
