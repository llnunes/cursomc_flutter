import 'package:cursomc/pages/categorias/categoria_home_page.dart';
import 'package:cursomc/pages/produtos/produto_home_page.dart';
import 'package:cursomc/util/prefs.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin<HomePage> {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initTabs();
  }

  _initTabs() async {
    // Primeiro busca o índice nas prefs.
    int tabIdx = await Prefs.getInt("tabIdx");

    // Depois cria o TabController
    // No método build na primeira vez ele poderá estar nulo
    _tabController = TabController(length: 2, vsync: this);

    // Agora que temos o TabController e o índice da tab,
    // chama o setState para redesenhar a tela
    setState(() {
      _tabController.index = tabIdx;
    });

    _tabController.addListener(() {
      Prefs.setInt("tabIdx", _tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sistema de Pedidos"),
        bottom: _tabController == null
            ? null
            : TabBar(
                controller: _tabController,
                tabs: <Widget>[
                  Tab(
                    text: "Categorias",
                    icon: Icon(Icons.category),
                  ),
                  Tab(
                    text: "Produtos",
                    icon: Icon(Icons.shop),
                  ),
                ],
              ),
      ),
      body: _tabController == null
          ? Center(
        child: Text("Teste"),
        //child: CircularProgressIndicator(),
      )
          : TabBarView(controller: _tabController, children: <Widget>[
        CategoriaHomePage(),
        ProdutoHomePage(),
      ]),
      //drawer: DrawerList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onClickAdicionarCarro,
      ),
    );
  }

  void _onClickAdicionarCarro() {
    //push(context, CarroFormPage());
  }
}
