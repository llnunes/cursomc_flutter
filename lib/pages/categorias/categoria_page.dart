import 'package:cursomc/model/categoria.dart';
import 'package:flutter/material.dart';

class CategoriaPage extends StatefulWidget {
  final Categoria categoria;

  CategoriaPage(this.categoria);

  @override
  _CategoriaPageState createState() => _CategoriaPageState();
}

class _CategoriaPageState extends State<CategoriaPage> {
  Color color = Colors.grey;

  Categoria get categoria => widget.categoria;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

//    FavoritoService.isFavorito(carro).then((favorito) {
//      setState(() {
//        color = favorito ? Colors.red : Colors.grey;
//      });
//    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Teste"),
    );
  }
}
