import 'package:flutter/material.dart';
import 'package:flutter_app_gerenciamentos/models/conta_model.dart';
import 'package:flutter_app_gerenciamentos/screens/conta/conta_screen.dart';

Widget cardConta(BuildContext context, Conta conta) {
  return InkWell(
    onTap: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => ContaScreen(id: conta.id!)));
    },
    child: Container(
      margin: EdgeInsets.only(right: 10, left: 10),
      width: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: conta.nome == "Nubank"
              ? Color.fromARGB(255, 80, 8, 139)
              : conta.nome == "Caixa"
                  ? Color.fromARGB(255, 13, 102, 218)
                  : conta.nome == "Inter"
                      ? Color.fromARGB(255, 231, 140, 3)
                      : Color.fromARGB(255, 190, 17, 17),
          boxShadow: [
            BoxShadow(
                color: Color(0x100000),
                blurRadius: 8,
                spreadRadius: 4,
                offset: Offset(0.0, 0.7))
          ]),
      child: Stack(
        children: [
          Positioned(
              top: 14,
              right: 12,
              child: Text(
                conta.nome,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              )),
          Positioned(
            top: 63,
            left: 16,
            child: Text(
              'Saldo em Conta\n\n\n JOAO MARCOS D M',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
          Positioned(
            top: 81,
            left: 16,
            child: Text(
              'R\$ ' + conta.valor.toString(),
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),
          )
        ],
      ),
    ),
  );
}
