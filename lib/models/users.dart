class Users {
  String status;
  List<Data> data;

  Users({this.status, this.data});

  Users.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String id;
  String name;
  String login;
  String email;
  Null systemUnitId;
  String active;

  Data(
      {this.id,
      this.name,
      this.login,
      this.email,
      this.systemUnitId,
      this.active});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    login = json['login'];
    email = json['email'];
    systemUnitId = json['system_unit_id'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['login'] = this.login;
    data['email'] = this.email;
    data['system_unit_id'] = this.systemUnitId;
    data['active'] = this.active;
    return data;
  }
}