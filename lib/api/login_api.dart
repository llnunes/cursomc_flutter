import 'dart:convert';

import 'package:cursomc/api/ApiResponse.dart';
import 'package:cursomc/model/cliente.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

class LoginApi {
  static Future<ApiResponse<Cliente>> login(String login, String senha) async {
    try {
      var url = 'https://curso-spring-21.herokuapp.com/login';

      Map<String, String> headers = {
        "Content-Type": "application/json"
      };

      Map params = {
        'email': login,
        'senha': senha,
      };
      String s = json.encode(params);
      print("> $s");
      var response = await http.post(url, body: s, headers: headers);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      //print('Response body: ${response.headers['authorization']}');

      var token = response.headers['authorization'].substring(7);

      Map<String, dynamic> decodedToken = JwtDecoder.decode(token.substring(7));
      // Now you can use your decoded token
      var email = decodedToken['sub'];

      if(token != null && response.statusCode == 200) {
        final user = new Cliente();
        user.email = email;
        user.token = token;
        
        print("user 2: $user");

        user.save();

        Cliente user2 = await Cliente.get();
        print("user 2: $user2");

        return ApiResponse.ok(result: user);
      } else {

        return ApiResponse.error(msg: "Erro no login");
      }

    } catch (error, exception) {
      print("Erro no login $error > $exception");
      return ApiResponse.error(msg: "Não foi possivel realizar o login. ");
    }
  }
}
