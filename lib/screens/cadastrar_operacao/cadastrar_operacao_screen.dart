import 'package:flutter/material.dart';
import 'package:flutter_app_gerenciamentos/models/conta_model.dart';
import 'package:flutter_app_gerenciamentos/models/operacao.dart';
import 'package:flutter_app_gerenciamentos/screens/home/home_screen.dart';
import 'package:flutter_app_gerenciamentos/services/conta_service.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter_app_gerenciamentos/services/operacao_service.dart';

class CadastrarOperacaoScreen extends StatefulWidget {

  late final String tipoOperacao;

  CadastrarOperacaoScreen({required this.tipoOperacao});

  @override
  State<CadastrarOperacaoScreen> createState() => _CadastrarOperacaoState();
}

class _CadastrarOperacaoState extends State<CadastrarOperacaoScreen> {
  final _nomeController = TextEditingController();
  final _resumoController = TextEditingController();
  final _custoController = TextEditingController();
  final _tipoController = TextEditingController();
  final _dataController = TextEditingController();
  ContaService cs = ContaService();
  DateTime selectdate = DateTime.now();
  OperacaoService os = OperacaoService();

  late Future<List> _carregaContas;
  late List<Conta> _contas;

  Conta ? _contaSelecionada;

  @override
  void initState(){
    _carregaContas = _getContas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            widget.tipoOperacao == "entrada" ? "Cadastro de Entrada" : "Cadastro de Saida"
          ),
        centerTitle: true,
        backgroundColor: widget.tipoOperacao == "entrada" ? Colors.green : Colors.red
      ),
      body: FutureBuilder(
        future: _carregaContas,
        builder: (BuildContext context, AsyncSnapshot snapshot ){
          if (snapshot.hasData){
            _contas = snapshot.data;
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _nomeController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "Nome")
                      ),
                  TextFormField(
                    controller: _resumoController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: "Resumo")
                  ),
                  TextFormField(
                    controller: _custoController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "Custo")
                  ),
                  GestureDetector(
                    onTap: ()=> _selectdate(context),
                    child: AbsorbPointer(
                      child: TextFormField(
                        controller: _dataController,
                        decoration: InputDecoration(
                          labelText: formatDate(
                              selectdate, [dd, '/', mm,'/', yyyy]
                          )
                        ),
                      ),
                    ),
                  ),
                  DropdownButtonFormField(
                      value: _contaSelecionada,
                      onChanged: (Conta ? conta){
                        setState(() {
                          _contaSelecionada = conta;
                        });
                      },
                      items: _contas.map((conta){
                        return DropdownMenuItem(
                            value: conta,
                            child: Text(conta.nome)
                        );
                      }).toList(),
                  ),
                    Padding(padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (){
                          Operacao novaOperacao = Operacao(
                              tipo: widget.tipoOperacao,
                              conta: _contaSelecionada!.id,
                              nome: _nomeController.text,
                              resumo: _resumoController.text,
                              data: selectdate.toString(),
                              custo: double.parse(_custoController.text
                              ));
                          os.add_Operacao(novaOperacao);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => HomeScreen())
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: widget.tipoOperacao == "entrada" ? Colors.green : Colors.red,
                          ),
                        child: Text("Cadastrar")
                        ),
                      ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      )
    );
  }
  Future <List> _getContas() async{
    return await cs.getAllContas();
  }
  Future <void> _selectdate(BuildContext context) async{
   final DateTime ? picked = await showDatePicker(context: context,
       initialDate: selectdate,
       firstDate: DateTime(2023,01),
       lastDate: DateTime(2030,01)
   );
   if(picked != null && picked != selectdate){
     setState(() {
       selectdate = picked;
     });
   }
}

}

