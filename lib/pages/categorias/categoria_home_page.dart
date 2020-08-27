import 'dart:async';

import 'package:cursomc/bloc/CategoriaBloc.dart';
import 'package:cursomc/model/categoria.dart';
import 'package:cursomc/pages/categorias/categoria_listview.dart';
import 'package:cursomc/util/event_bus.dart';
import 'package:cursomc/widgets/text_error.dart';
import 'package:flutter/material.dart';

class CategoriaHomePage extends StatefulWidget {
  @override
  _CategoriaHomePageState createState() => _CategoriaHomePageState();
}

class _CategoriaHomePageState extends State<CategoriaHomePage>
    with AutomaticKeepAliveClientMixin<CategoriaHomePage> {
  List<Categoria> categorias;

  StreamSubscription<Event> subscription;

  final _bloc = CategoriaBloc();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _bloc.fetch();

    // Escutando uma stream
    final bus = EventBus.get(context);
    subscription = bus.stream.listen((Event e) {
      print("Event $e");
      _bloc.fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return StreamBuilder(
      stream: _bloc.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return TextError("Não foi possivel recuperar as categorias");
        }
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        List<Categoria> categorias = snapshot.data;
        return RefreshIndicator(
          onRefresh: _onRefresh,
          child: CategoriasListView(categorias),
        );
      },
    );
  }

  Future<void> _onRefresh() {
    return _bloc.fetch();
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
    subscription.cancel();
  }
}
