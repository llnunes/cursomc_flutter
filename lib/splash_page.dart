import 'package:cursomc/model/cliente.dart';
import 'package:cursomc/pages/home_page.dart';
import 'package:cursomc/pages/login_page.dart';
import 'package:cursomc/sql/db_helper.dart';
import 'package:cursomc/util/nav.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future<Cliente> futureC = Cliente.get();

    Future futureA = DatabaseHelper.getInstance().db;
    Future futureB = Future.delayed(Duration(seconds: 3));
    print("cabou delay");

    Future.wait([futureA,futureB,futureC]).then((List values) {
      Cliente user = values[2];
      print(user);
      if(user != null) {
        push(context, HomePage(), replace: true);
      } else {
        push(context, LoginPage(), replace: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[200],
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
