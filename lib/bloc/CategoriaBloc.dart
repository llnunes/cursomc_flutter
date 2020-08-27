import 'package:cursomc/api/categoria_api.dart';
import 'package:cursomc/bloc/SimpleBloc.dart';
import 'package:cursomc/model/categoria.dart';
import 'package:cursomc/sql/dao/CategoriaDAO.dart';
import 'package:cursomc/util/network.dart';

class CategoriaBloc extends SimpleBloc<List<Categoria>> {
  Future<List<Categoria>> fetch() async {
    List<Categoria> categorias;
    try {
      if (!await isNetworkOn()) {
        List<Categoria> categorias = await CategoriaDAO().findAll();
        print('Categorias carregadas. $categorias');
        add(categorias);
        return categorias;
      }

      categorias = await CategoriasApi.getCategorias();

      if (categorias.isNotEmpty) {
        final dao = CategoriaDAO();

        dao.count().then((x) => print(x));
        // salvar todos os categorias
        categorias.forEach((c) => dao.save(c));
        //print('salvos');
      }

      add(categorias);
    } catch (e) {
      addError(e);
    }
    return categorias;
  }
}
