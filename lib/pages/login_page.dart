import 'package:cursomc/api/ApiResponse.dart';
import 'package:cursomc/bloc/LoginBloc.dart';
import 'package:cursomc/model/cliente.dart';
import 'package:cursomc/pages/home_page.dart';
import 'package:cursomc/util/alert.dart';
import 'package:cursomc/util/nav.dart';
import 'package:cursomc/widgets/app_button.dart';
import 'package:cursomc/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _bloc = LoginBloc();

  final _tLogin = TextEditingController();

  final _tSenha = TextEditingController();

  final _focusSenha = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sistema de Pedidos",
        ),
        centerTitle: true,
      ),
      body: _body(context),
    );
    ;
  }

  _body(BuildContext context) {
    _tLogin.text = 'lucas.lopesdf@gmail.com';
    _tSenha.text = '123';

    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            AppText(
              "Login",
              "Informe seu login.",
              controller: _tLogin,
              validator: _validateLogin,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              nextFocus: _focusSenha,
            ),
            SizedBox(
              height: 10,
            ),
            AppText(
              "Senha",
              "Informe sua senha.",
              password: true,
              controller: _tSenha,
              validator: _validateSenha,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              focusNode: _focusSenha,
            ),
            SizedBox(
              height: 20,
            ),
            StreamBuilder<bool>(
                //stream: _bloc.stream,
                initialData: false,
                builder: (context, snapshot) {
                  return AppButton(
                    "Login",
                    onPressed: () => _onClickLogin(context),
                    showProgress: snapshot.data,
                  );
                }),
            SizedBox(
              height: 8,
            ),
            StreamBuilder<bool>(
                //stream: _bloc.stream,
                initialData: false,
                builder: (context, snapshot) {
                  return AppButton(
                    "Registrar",
                    corPadrao: Colors.green,
                    onPressed: () => _onClickLogin(context),
                    showProgress: snapshot.data,
                  );
                }),
          ],
        ),
      ),
    );
  }

  void _onClickLogin(context) async {
    if (!this._formKey.currentState.validate()) {
      return;
    }

    var login = _tLogin.text;
    var senha = _tSenha.text;

    print(" Login: $login Senha: $senha");

    ApiResponse response = await _bloc.login(login, senha);
    print(response.msg);

    if (response.ok) {
      Cliente user = response.result;
      print(">>> $user");
      push(context, HomePage(), replace: true);
    } else {
      alert(context, "Carros", response.msg);

    }
  }

  String _validateLogin(String text) {
    if (text.isEmpty) {
      return "Digite o login.";
    }
    return null;
  }

  String _validateSenha(String text) {
    if (text.isEmpty) {
      return "Digite a senha..";
    }
    return null;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _bloc.dispose();
  }
}
