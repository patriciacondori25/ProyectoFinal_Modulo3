// ignore_for_file: camel_case_types, override_on_non_overriding_member, library_private_types_in_public_api

import 'package:carrito_paty/componentes/preferenciasUsuario.dart';
import 'package:carrito_paty/constantes.dart';
import 'package:carrito_paty/controlador/leerDatos.dart';
import 'package:carrito_paty/modelo/producto.dart';
import 'package:flutter/material.dart';
import '../componentes/productocatalogo.dart';
import '../controlador/crearDatos.dart';
import '../modelo/carrito.dart';

class catalogo extends StatefulWidget {
  const catalogo({Key? key}) : super(key: key);

  @override
  _catalogoState createState() => _catalogoState();
}

class _catalogoState extends State<catalogo> {
  String usuario = "";
  PreferenciasUsuario pref = PreferenciasUsuario();
  void cargaPreferencias() async {
    usuario = await pref.getLogin();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    leerDatos leerListadoEvento = leerDatos();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
            child: Container(
          padding: const EdgeInsets.fromLTRB(
              0, kDefaultPadding, 0, kDefaultPadding / 2),
          height: 60,
          child: const Text(
            "CATALOGO PRODUCTOS",
            style: styleTitulo,
          ),
        )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding / 5),
          child: StreamBuilder<List<Producto>>(
            stream: leerListadoEvento.leerProductos(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Producto>? producto = snapshot.data;

                return CustomListView(
                  vlistadoproductos: producto,
                  usuario: usuario,
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              return const CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(Colors.transparent));
            },
          ),
        ))
      ],
    );
  }
}

class CustomListView extends StatelessWidget {
  final List<Producto>? vlistadoproductos;
  final String usuario;

  const CustomListView(
      {Key? key, required this.vlistadoproductos, required this.usuario})
      : super(key: key);

  @override
  Widget build(context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //maxCrossAxisExtent: 180, //300,
            childAspectRatio: 1 / 1.09, //1.7, //esto controla el tamano del
            crossAxisSpacing: 5, //20,
            mainAxisSpacing: 5,
            // maxCrossAxisExtent: 180,
            crossAxisCount: 2), //20),

        itemCount: vlistadoproductos?.length,
        itemBuilder: (BuildContext ctx, currentIndex) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ColorBackground,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: productocatalogo(
              foto: vlistadoproductos![currentIndex].foto,
              codigo: vlistadoproductos![currentIndex].codigo,
              nombre: vlistadoproductos![currentIndex].nombre,
              precio: vlistadoproductos![currentIndex].precio.toDouble(),
              producto: vlistadoproductos![currentIndex].producto,
              press: () async {
                PreferenciasUsuario pref = PreferenciasUsuario();
                crearDatos crearCarrito = crearDatos();
                crearCarrito.createCarrito(carrito(
                  nombre: vlistadoproductos![currentIndex].nombre,
                  precio: vlistadoproductos![currentIndex].precio.toDouble(),
                  producto: vlistadoproductos![currentIndex].producto,
                  foto: vlistadoproductos![currentIndex].foto,
                  cantidad: 1,
                  total: vlistadoproductos![currentIndex].precio.toDouble(),
                  usuario: await pref.getLogin(),
                  carritoid: '',
                ));
              },
            ),
          );
        });
  }
}
