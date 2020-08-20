import 'dart:convert' as Convert;

import 'package:cursomc/util/prefs.dart';

class Cliente {

  String email;
  String token;

  Cliente(
      {this.email,
       this.token});

  Cliente.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['token'] = this.token;
    return data;
  }

  @override
  String toString() {
    return 'Cliente{email: $email, token: $token}';
  }

  void save() {
    Map map = toJson();
    print("Mapa: $map");
    String json = Convert.json.encode(map);
    print("json: $json");
    Prefs.setString("user.prefs", json);

  }

  static Future<Cliente> get() async {
    String str = await Prefs.getString("user.prefs");

    if(str.isEmpty) {
      return null;
    }

    Map map = Convert.json.decode(str);

    Cliente cliente = Cliente.fromJson(map);
    return cliente;
  }

  static void clear() {
    Prefs.setString("user.prefs", "");
  }
}