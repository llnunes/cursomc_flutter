import 'dart:convert' as convert;

import 'package:cursomc/sql/entity.dart';
import 'package:cursomc/util/event_bus.dart';

class CategoriaEvent extends Event {
  String acao;
  String tipo;

  CategoriaEvent(this.acao, this.tipo);

  @override
  String toString() {
    return 'CategoriaEvent{acao: $acao, tipo: $tipo}';
  }
}

class Categoria extends Entity {
  int id;
  String nome;

  Categoria({this.id, this.nome});

  Categoria.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nome = map['nome'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    return data;
  }

  String toJson() {
    return convert.json.encode(toMap());
  }
}
