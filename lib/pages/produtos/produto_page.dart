import 'package:cursomc/model/produto.dart';
import 'package:flutter/material.dart';

class ProdutoPage extends StatefulWidget {

  final Produto produto;

  ProdutoPage(this.produto);

  @override
  _ProdutoPageState createState() => _ProdutoPageState();
}

class _ProdutoPageState extends State<ProdutoPage> {

  Color color = Colors.grey;

  Produto get produto => widget.produto;

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
