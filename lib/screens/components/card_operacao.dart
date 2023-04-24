import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter_app_gerenciamentos/models/operacao.dart';

Widget cardOperacao(BuildContext context, int index, Operacao operacao) {
  return Container(
    margin: EdgeInsets.only(bottom: 8, left: 10, right: 10),
    height: 68,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              color: Color(0x0400000),
              blurRadius: 10,
              spreadRadius: 10,
              offset: Offset(0.0, 0.8)
          )
        ],
        color: Colors.white
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment:  MainAxisAlignment.center,
              children: [
                Text(
                  operacao.nome,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: operacao.tipo == "entrada" ? Colors.green : Colors.red
                  ),
                ),
                Text(
                  operacao.resumo,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey
                  ),
                ),
              ],
            )
          ],
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "R\$ " + operacao.custo.toString(),
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey
                  ),
                ),
                Text(
                  formatDate(DateTime.parse(operacao.data),
                      [dd, '/', mm, '/', yyyy]).toString(),
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey
                  ),
                ),
              ],
            )
          ],
        )
      ],
    ),
  );
}