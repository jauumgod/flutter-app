import 'package:flutter/material.dart';
import 'package:flutter_app_gerenciamentos/models/conta_model.dart';
import 'package:flutter_app_gerenciamentos/screens/home/home_screen.dart';
import 'package:flutter_app_gerenciamentos/services/conta_service.dart';


class CadastroContaScreen extends StatelessWidget{
  final _nomeController = TextEditingController();
  final _valorController = TextEditingController();
  ContaService cs = ContaService();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Conta"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _nomeController,
                  keyboardType:  TextInputType.text,
                  decoration: InputDecoration(labelText: "Nome"),
                ),
                TextFormField(
                  controller: _valorController,
                  keyboardType:  TextInputType.number,
                  decoration: InputDecoration(labelText: "Valor"),
                ),
                Padding(
                  padding: EdgeInsets.only(top:20, bottom: 20),
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (){
                        Conta novaConta = Conta(
                          nome: _nomeController.text,
                          valor: double.parse(_valorController.text)
                        );
                        cs.adicionarConta(novaConta);
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_)=>HomeScreen())
                        );
                      },
                      child: Text(
                        "Cadastrar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}