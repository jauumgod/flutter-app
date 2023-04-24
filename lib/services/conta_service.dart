import 'package:flutter_app_gerenciamentos/models/conta_model.dart';
import 'package:flutter_app_gerenciamentos/utils/util_db.dart';

class ContaService {
  List<Conta> _contaList = [];

  void adicionarConta(Conta conta) {
    DbUtil.insereDados('conta', conta.toMap());
  }

  Future<List> getAllContas() async {
    final dataList = await DbUtil.pegarDados('conta');
    _contaList = dataList.map((contas) => Conta.fromMap(contas)).toList();
    return _contaList;
  }

  Future<Conta> getConta(int id) async {
    String whereString = "id = ?";
    List<dynamic> whereArguments = [id];
    final dataList =
        await DbUtil.getDataWhere('conta', whereString, whereArguments);
    return Conta.fromMap(dataList.first);
  }

  void AtualizaValorConta(int? id, double custo, String tipoOperacao) {
    String sql;

    if (tipoOperacao == "entrada") {
      sql = "UPDATE conta SET valor = valor + ? WHERE id = ?";
    } else {
      sql = "UPDATE conta SET valor = valor - ? WHERE id = ?";
    }
    List<dynamic> argumentos = [custo, id];
    DbUtil.executaSQL(sql, argumentos);
  }
}
