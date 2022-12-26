// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import '../constantes.dart';
import 'blueButton.dart';

class productocatalogo extends StatefulWidget {
  const productocatalogo({
    Key? key,
    required //this.size,
        this.foto,
    required this.codigo,
    required this.nombre,
    required this.precio,
    required this.producto,
    required this.press,
  }) : super(key: key);

  //final Size size;
  final String foto;
  final String codigo;
  final String nombre;
  final double precio;
  final String producto;
  final Function press;

  @override
  State<productocatalogo> createState() => _productocatalogoState();
}

class _productocatalogoState extends State<productocatalogo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: kDefaultPadding / 2,
        right: kDefaultPadding / 2,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding / 2, //* 2.5,
      ),

      //height: 800, // * 0.4,

      child: Column(
        children: <Widget>[
          SizedBox(height: 100, child: Image.network(widget.foto)),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          SizedBox(
            height: 25,
            child: RowWithUpperText(
              texto: widget.nombre,
            ),
          ),
          SizedBox(
            height: 25,
            child: RowWithUpperText(
              texto: widget.precio.toString(),
            ),
          ),
          BottonBlue(
            alto: 28,
            ancho: 100,
            colorboton: colorPrimario,
            texto: "Agregar",
            colorTexto: ColorBackground,
            press: () => () {
              widget.press();
            },
            habilitado: 0,
          ),
        ],
      ),
    );
  }
}

class RowWithUpperText extends StatelessWidget {
  const RowWithUpperText({
    Key? key,
    required this.texto,
  }) : super(key: key);
  final String texto;
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 40,
      padding: const EdgeInsets.all(kDefaultPadding / 5),
      decoration: BoxDecoration(
        border: Border.all(color: ColorBackground, width: 0),
        color: ColorBackground,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              texto.toUpperCase(),
              textAlign: TextAlign.center,
              //style: Theme.of(context).textTheme.button,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: colorPrimario),
            ),
          ),
        ],
      ),
    );
  }
}
