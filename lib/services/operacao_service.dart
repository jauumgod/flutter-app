import 'package:flutter_app_gerenciamentos/services/conta_service.dart';
import 'package:flutter_app_gerenciamentos/utils/util_db.dart';
import 'package:flutter_app_gerenciamentos/models/operacao.dart';

class OperacaoService {
  List<Operacao> _operacaoList = [];
  ContaService cs = ContaService();

  void add_Operacao(Operacao operacao) {
    DbUtil.insereDados('operacao', operacao.toMap());
    cs.AtualizaValorConta(operacao.conta, operacao.custo, operacao.tipo);
  }

  Future<List> getAllOperacoes() async {
    final _dataList = await DbUtil.pegarDados('operacao');
    _operacaoList =
        _dataList.map((operacoes) => Operacao.fromMap(operacoes)).toList();
    return _operacaoList;
  }

  Future<List> getOperacoesConta(int id) async {
    String whereString = "conta = ?";
    List<dynamic> whereArguments = [id];
    final dataList =
        await DbUtil.getDataWhere('operacao', whereString, whereArguments);
    return dataList.map((operacoes) => Operacao.fromMap(operacoes)).toList();
  }
}
