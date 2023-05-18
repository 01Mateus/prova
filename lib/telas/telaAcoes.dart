import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../componentes/botao.dart';

class tela2 extends StatefulWidget {
  const tela2({super.key});

  @override
  State<tela2> createState() => _tela2State();
}

class _tela2State extends State<tela2> {

  late String textoIBOVESPA = '';
  late String textoIFIX = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text('Finanças de Hoje'), backgroundColor: Color.fromARGB(255, 25, 97, 28),),
       body: criarConteudo(),
    );
  }

    criarConteudo() {
    return Center(
      child: Column(
        children: [
          Text('Ações'),
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
            child: GridView.count(
              crossAxisCount: 2, 
              childAspectRatio: 2,
              children: [
                Text('IBOVESPA', style: TextStyle(fontSize: 16),),
                Row(
                  children: [
                    Text(textoIBOVESPA, style: TextStyle(fontSize: 19),),
                  ],
                  
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('IFIX', style: TextStyle(fontSize: 16),),
                    Row(
                      children: [
                        Text(textoIFIX, style: TextStyle(fontSize: 19),),
                      ],
                    ),
                  ],
                ),
              ],
              
              ),
          ),
          Botao(texto: 'Ir para Bitcoin', funcao: irParaBitcoin,),
        ],
      ),
      
      
    );
  }

  irParaBitcoin() {
    Navigator.pushNamed(context, 'tela3');
  }
}