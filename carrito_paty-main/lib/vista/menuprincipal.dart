// ignore_for_file: file_names, no_logic_in_create_state, library_private_types_in_public_api, camel_case_types

import 'package:carrito_paty/vista/carritoview.dart';
import 'package:carrito_paty/vista/catalogo.dart';
import 'package:flutter/material.dart';

import '../componentes/preferenciasUsuario.dart';
import '../modelo/usuario.dart';
import 'usuarioview.dart';

class menuprincipal extends StatefulWidget {
  final Usuario usuario;

  const menuprincipal({
    Key? key,
    required this.usuario,
  }) : super(key: key);

  @override
  _menuprincipalState createState() => _menuprincipalState(
        [
          const catalogo(),
          const carritoview(),
          const usuarioview(),
        ],
        usuario.login,
      );
}

class _menuprincipalState extends State<menuprincipal> {
  String usuario = "";
  PreferenciasUsuario pref = PreferenciasUsuario();

  void cargaPreferencias() async {
    usuario = await pref.getLogin();

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    cargaPreferencias();
  }

  final List<Widget> children;
  _menuprincipalState(this.children, this.usuario);

  int indiceActual = 0;

  final List<String> titulos = [
    "Catalogo",
    "Carrito",
    "Salir",
  ];
  final List<IconData> iconos = [
    Icons.sell,
    Icons.shopping_cart,
    Icons.exit_to_app,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarprincipal(
          iconos[indiceActual], titulos[indiceActual], context, usuario),
      body: children[indiceActual],
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: indiceActual, // this will be set when a new tab is tapped
      onTap: (int index) => setState(() => indiceActual = index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.dvr),
          label: 'Catalogo',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Carrito',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.power_settings_new),
          label: 'Salir',
        ),
      ],
    );
  }
}

AppBar buildAppBarprincipal(
    IconData rutaicono, String texto, BuildContext context1, String usuario) {
  return AppBar(
    centerTitle: true,
    elevation: 0,
    leading: IconButton(
      icon: Icon(rutaicono), //SvgPicture.asset(rutaicono),
      onPressed: () {},
    ),
    title: Row(
      children: <Widget>[
        Text(
          "$texto - Usuario: $usuario",
          textAlign: TextAlign.left,
          style: const TextStyle(fontSize: 18),
        ),
      ],
    ),
    actions: const <Widget>[],
  );
}
