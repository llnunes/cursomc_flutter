import 'package:cursomc/api/ApiResponse.dart';
import 'package:cursomc/api/login_api.dart';
import 'package:cursomc/bloc/BooleanBloc.dart';
import 'package:cursomc/model/cliente.dart';

class LoginBloc extends BooleanBloc{

  Future<ApiResponse<Cliente>> login(String email, String senha) async {
    add(true);
    ApiResponse response = await LoginApi.login(email, senha);
    add(false);

    return response;
  }
}