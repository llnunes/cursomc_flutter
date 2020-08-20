import 'dart:convert' as convert;

import 'package:cursomc/util/event_bus.dart';
import 'package:cursomc/util/sql/entity.dart';

class ProdutoEvent extends Event{

  String acao;
  String tipo;

  ProdutoEvent(this.acao, this.tipo);

  @override
  String toString() {
    return 'ProdutoEvent{acao: $acao, tipo: $tipo}';
  }
}


class Produto extends Entity{
  int id;
  String nome;
  String preco;

  Produto(
      {this.id,
        this.nome,
        this.preco});

  Produto.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nome = map['nome'];
    preco = map['preco'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['preco'] = this.preco;
    return data;
  }

  String toJson() {
    return convert.json.encode(toMap());
  }
}