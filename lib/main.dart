import "package:flutter/material.dart";
import 'package:flutter_app_gerenciamentos/screens/cadastrar_conta/cadastrar_conta_screen.dart';
import 'package:flutter_app_gerenciamentos/screens/cadastrar_operacao/cadastrar_operacao_screen.dart';
import 'package:flutter_app_gerenciamentos/screens/home/home_screen.dart';


void main()=>runApp(Main());

class Main extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: CadastroContaScreen()
      //home: CadastrarOperacaoScreen(tipoOperacao: "entrada"),
      home: HomeScreen()
    );
  }
}

