import 'package:cursomc/model/categoria.dart';
import 'package:cursomc/sql/base_dao.dart';

class CategoriaDAO extends BaseDAO<Categoria> {
  @override
  String get tableName => "categoria";

  @override
  Categoria fromMap(Map<String, dynamic> map) {
    return Categoria.fromMap(map);
  }
}
