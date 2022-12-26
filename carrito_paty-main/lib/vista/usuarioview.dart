// ignore_for_file: library_private_types_in_public_api, camel_case_types

import 'package:carrito_paty/controlador/crearDatos.dart';
import 'package:carrito_paty/modelo/usuario.dart';
import 'package:carrito_paty/vista/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../componentes/blueButton.dart';
import '../componentes/inputTextFormulario.dart';
import '../componentes/preferenciasUsuario.dart';
import '../constantes.dart';

// ignore: camel_case_types
class usuarioview extends StatefulWidget {
  const usuarioview({Key? key}) : super(key: key);

  @override
  _usuarioviewState createState() => _usuarioviewState();
}

class _usuarioviewState extends State<usuarioview> {
  PreferenciasUsuario pref = PreferenciasUsuario();

  TextEditingController nombreusuario = TextEditingController();
  TextEditingController contrasena = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: kDefaultPadding,
            ),
            Container(
              padding: const EdgeInsets.all(kDefaultPadding / 2),
              child: const Text(
                "Creación de usuario",
                style: styleTitulo,
              ),
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: InputTextFormulario(
                controladorTexto: nombreusuario,
                textoEntrada: "Nombre de usuario",
                textoValidacion: "Debe ingresar su usuario",
                icono: 0,
                icon: Icons.person_outline,
                oscurecer: false,
                tipoValidacion: 4,
                textoContrasena: nombreusuario,
                key: null,
                colorborde: Colors.grey,
                habilita: 0,
              ),
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: InputTextFormulario(
                controladorTexto: contrasena,
                textoEntrada: "Ingrese su contraseña",
                textoValidacion: "Debe ingresar su contraseña",
                icono: 0,
                icon: Icons.person_outline,
                oscurecer: true,
                tipoValidacion: 4,
                textoContrasena: contrasena,
                key: null,
                colorborde: Colors.grey,
                habilita: 0,
              ),
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            BottonBlue(
              alto: 40,
              ancho: 350,
              colorboton: colorPrimario,
              texto: "Crear usuario",
              colorTexto: ColorBackground,
              press: () => () async {
                Usuario usu = Usuario(
                    usuario: '',
                    login: nombreusuario.text,
                    clave: contrasena.text);

                crearDatos crear = crearDatos();
                crear.createUsuario(usu);
              },
              habilitado: 0,
            ),
            const SizedBox(
              height: 20,
            ),
            BottonBlue(
              alto: 40,
              ancho: 350,
              colorboton: colorPrimario,
              texto: "Cerrar sesión",
              colorTexto: ColorBackground,
              press: () => () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const login(),
                  ),
                );
              },
              habilitado: 0,
            ),
          ],
        ),
      ),
    );
  }
}
