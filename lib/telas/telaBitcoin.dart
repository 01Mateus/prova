import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../componentes/botao.dart';

class tela3 extends StatefulWidget {
  const tela3({super.key});

  @override
  State<tela3> createState() => _tela3State();
}

class _tela3State extends State<tela3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Finanças de Hoje'), backgroundColor: Color.fromARGB(255, 36, 121, 38),),
      body: criarConteudo(),
    );
  }


criarConteudo() {
    return Center(
      child: Column(
        children: [
          Text('BitCoin'),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(10.0),
            width: 350,
            height: 300,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Botao(texto: 'Página Principal', funcao: irPaginaPrincipal,)
        ],
      ),
    );
}

irPaginaPrincipal() {
Navigator.pushNamed(context, 'tela1');
  }
}