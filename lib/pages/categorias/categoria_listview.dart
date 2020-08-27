import 'package:cursomc/model/categoria.dart';
import 'package:flutter/material.dart';

class CategoriasListView extends StatelessWidget {
  final List<Categoria> categorias;

  CategoriasListView(this.categorias);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: categorias.length,
        itemBuilder: (context, index) {
          Categoria c = categorias[index];
          return Card(
            color: Colors.grey[100],
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    c.nome,
                    style: TextStyle(fontSize: 25),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  ButtonBarTheme(
                    data: ButtonBarTheme.of(context),
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('DETALHES'),
                          onPressed: () => {},
                        ),
                        FlatButton(
                          child: const Text('SHARE'),
                          onPressed: () {
                            /* ... */
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
