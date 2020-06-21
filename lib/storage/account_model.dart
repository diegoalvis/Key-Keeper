class AccountModel {
  String name;
  String user;
  String password;

  AccountModel({this.name, this.user, this.password});

  AccountModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    user = json['user'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['user'] = this.user;
    data['password'] = this.password;
    return data;
  }
}