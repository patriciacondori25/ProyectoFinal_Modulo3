// ignore_for_file: camel_case_types, no_logic_in_create_state, library_private_types_in_public_api, use_build_context_synchronously

import 'package:carrito_paty/componentes/preferenciasUsuario.dart';
import 'package:carrito_paty/constantes.dart';
import 'package:carrito_paty/vista/menuprincipal.dart';
import 'package:flutter/material.dart';

import '../componentes/barras.dart';
import '../componentes/blueButton.dart';
import '../componentes/inputTextFormulario.dart';
import '../controlador/leerDatos.dart';
import '../modelo/usuario.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  PreferenciasUsuario pref = PreferenciasUsuario();

  TextEditingController nombreusuario = TextEditingController();
  TextEditingController contrasena = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: buildAppBar(),
        body: SingleChildScrollView(
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
                    "Ingrese datos",
                    style: styleTitulo,
                  ),
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
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
                  alto: 48,
                  ancho: size.width * 0.25,
                  colorboton: colorPrimario,
                  texto: "Ingresar",
                  colorTexto: ColorBackground,
                  press: () => () async {
                    leerDatos validarUsuario = leerDatos();
                    Usuario usuariovalidado = await validarUsuario
                        .cargarUsuario(nombreusuario.text, contrasena.text);

                    if (usuariovalidado.login != "") {
                      pref.setUsuario(usuariovalidado.usuario);
                      pref.setLogin(usuariovalidado.login);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => menuprincipal(
                            usuario: usuariovalidado,
                          ),
                        ),
                      );
                    }
                  },
                  habilitado: 0,
                ),
              ],
            ),
          ),
        ));
  }
}
