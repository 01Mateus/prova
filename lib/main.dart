import 'package:flutter/material.dart';
import 'package:prova/telas/telaAcoes.dart';
import 'package:prova/telas/telaBitcoin.dart';
import 'package:prova/telas/telaMoedas.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'tela1',

      routes: {
        'tela1' :(context) => tela1(),
        'tela2' :(context) => tela2(),
        'tela3' :(context) => tela3(),
      },
    );
  }
}