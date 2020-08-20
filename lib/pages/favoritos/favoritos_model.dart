
import 'package:cursomc/model/produto.dart';
import 'package:flutter/cupertino.dart';

class FavoritosModel extends ChangeNotifier{
  List<Produto> produtos = [];

  Future<List<Produto>> getProdutos () async {
    //carros = await FavoritoService.getCarros();
    notifyListeners();

    return produtos;
  }
}