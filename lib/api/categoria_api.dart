import 'dart:convert' as convert;

import 'package:cursomc/model/categoria.dart';
import 'package:cursomc/util/http_helper.dart' as http;

class CategoriasApi {
  static Future<List<Categoria>> getCategorias() async {
    var url = 'https://curso-spring-21.herokuapp.com/categorias';

    print("GET > " + url);

    var response = await http.get(url);

    String json = response.body;

    List mapResponse = convert.json.decode(json);

    return mapResponse.map<Categoria>((map) => Categoria.fromMap(map)).toList();
  }
}
