import 'package:carrito_paty/constantes.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
    centerTitle: true,
    elevation: 0,
    //leading: IconButton(
    //icon: SvgPicture.asset("assets/icons/menu.svg"),
    //onPressed: () {},
    //),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: const <Widget>[
        Text(
          "Venta de computadoras",
          textAlign: TextAlign.center,
          style: styleTitulo,
        ),
      ],
    ),
  );
}
