import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Botao extends StatefulWidget {
  final texto;
  final funcao;
  const Botao({super.key, this.texto, this.funcao});

  @override
  State<Botao> createState() => _BotaoState();
}

class _BotaoState extends State<Botao> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Color.fromARGB(255, 17, 110, 14),
          shadowColor: Color.fromARGB(255, 148, 148, 148),
          elevation: 15,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          minimumSize: const Size(150, 40),
        ),
        onPressed: widget.funcao,
        child: Text(widget.texto),
      ),
    );
  }
}