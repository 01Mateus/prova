import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart';

import '../componentes/botao.dart';

class tela1 extends StatefulWidget {
  const tela1({super.key});

  @override
  State<tela1> createState() => _tela1State();
}

class _tela1State extends State<tela1> {
 void initState() {
    super.initState();
    buscarMoeda();
  }
   
  String valorDolarTexto = '';
  String valorEuroTexto = '';
  String valorPesoTexto = '';
  String valorYenTexto = '';

  String dolarVariacao = 'Variação do Dólar';
  String euroVariacao = 'Variação do Euro';
  String pesoVariacao = 'Variação do Peso';
  String yenVariacao = 'Variação do Yen';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Finanças de Hoje'), backgroundColor: Color.fromARGB(255, 22, 82, 24),), 
      body: criarConteudo(),
    );   
  }

     buscarMoeda() async {
    final String urlFinance = 'https://api.hgbrasil.com/finance?format=json-cors&key=cda28e75';
    Response resposta = await get(Uri.parse(urlFinance));
    Map financia = json.decode(resposta.body);
    setState(() {

      //Valor
       String valorDolar = '${financia['results']['currencies']['USD']['buy']}';
      valorDolarTexto = valorDolar;
       
       String valorEuro = '${financia['results']['currencies']['EUR']['buy']}';
       valorEuroTexto = valorEuro;

      String valorPeso = '${financia['results']['currencies']['ARS']['buy']}';
      valorPesoTexto = valorPeso;

      String valorYen = '${financia['results']['currencies']['JPY']['buy']}';
      valorYenTexto = valorYen;


      //Variação
      dynamic variacaoDoDolar = financia['results']['currencies']['USD']['variation'];
      dolarVariacao = '$variacaoDoDolar';

      dynamic variacaoDoEuro = financia['results']['currencies']['EUR']['variation'];
      euroVariacao = '$variacaoDoEuro';
      
      dynamic variacaoDoPeso = financia['results']['currencies']['ARS']['variation'];
      pesoVariacao = '$variacaoDoPeso';

      dynamic variacaoDoYen = financia['results']['currencies']['JPY']['variation'];
      yenVariacao = '$variacaoDoYen';
    });
  }

criarConteudo() {
  return Center(
    child: Column(
      children: [
        Text('MOEDAS'),
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.all(3.0),
          padding: const EdgeInsets.all(3.0),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Dólar', style: TextStyle(fontSize: 16)),
                  Row(
                    children: [
                      Text(valorDolarTexto, style: TextStyle(fontSize: 19)),
                      SizedBox(width: 5),
                      Container(
                        width: 60,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          dolarVariacao,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Euro', style: TextStyle(fontSize: 16)),
                  Row(
                    children: [
                      Text(valorEuroTexto, style: TextStyle(fontSize: 19)),
                      SizedBox(width: 5),
                      Container(
                        width: 60,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          euroVariacao,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Peso', style: TextStyle(fontSize: 16)),
                  Row(
                    children: [
                      Text(valorPesoTexto, style: TextStyle(fontSize: 19)),
                      SizedBox(width: 5),
                      Container(
                        width: 60,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          pesoVariacao,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Yen', style: TextStyle(fontSize: 16)),
                  Row(
                    children: [
                      Text(valorYenTexto, style: TextStyle(fontSize: 19)),
                      SizedBox(width: 5),
                      Container(
                        width: 60,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          yenVariacao,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              
            ],
          ),
        ),
                Botao(texto: 'Ir para Ações', funcao: IrParaAcoes),
      ],
    ),
  );
  
  
}
    IrParaAcoes() {
    Navigator.pushNamed(context, 'tela2');
  }
}