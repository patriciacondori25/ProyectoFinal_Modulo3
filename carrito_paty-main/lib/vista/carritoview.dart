// ignore_for_file: camel_case_types, library_private_types_in_public_api

import 'package:carrito_paty/constantes.dart';
import 'package:carrito_paty/controlador/borrarDatos.dart';
import 'package:carrito_paty/controlador/leerDatos.dart';
import 'package:carrito_paty/modelo/carrito.dart';
import 'package:flutter/material.dart';

import '../componentes/blueButton.dart';
import '../componentes/preferenciasUsuario.dart';

class carritoview extends StatefulWidget {
  const carritoview({Key? key}) : super(key: key);

  @override
  _carritoviewState createState() => _carritoviewState();
}

class _carritoviewState extends State<carritoview> {
  leerDatos leer = leerDatos();
  PreferenciasUsuario pref = PreferenciasUsuario();
  String usuario = "";
  void cargaPreferencias() async {
    usuario = await pref.getLogin();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    cargaPreferencias();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding / 5),
            child: StreamBuilder<List<carrito>>(
              stream: leer.leerCarritos(usuario),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<carrito>? car = snapshot.data;

                  return CustomListView(
                    vCarrito: car,
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                return const CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.transparent));
              },
            ),
          ),
        ),
      ],
    );
  }
}

class CustomListView extends StatelessWidget {
  final List<carrito>? vCarrito;

  const CustomListView({Key? key, required this.vCarrito}) : super(key: key);

  @override
  Widget build(context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1 / 0.3, crossAxisCount: 1),
        itemCount: vCarrito?.length,
        itemBuilder: (BuildContext ctx, currentIndex) {
          return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: ColorBackground,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ColorBackground,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                                height: 100,
                                child: Image.network(
                                    vCarrito![currentIndex].foto)),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                    height: 20,
                                    child: Text(
                                        "Nombre Producto: ${vCarrito![currentIndex].nombre}")),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                    height: 20,
                                    child: Text(
                                        "Cantidad: ${vCarrito![currentIndex].cantidad.toString()}")),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                    height: 20,
                                    child: Text(
                                        "Precio: ${vCarrito![currentIndex].precio.toString()}")),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                    height: 20,
                                    child: Text(
                                        "Total: ${vCarrito![currentIndex].total.toString()}")),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  child: BottonBlue(
                                    alto: 20,
                                    ancho: 80,
                                    colorboton: colorPrimario,
                                    texto: "Borrar",
                                    colorTexto: ColorBackground,
                                    press: () => () async {
                                      borrarDatos borra = borrarDatos();
                                      borra.borrarCarrito(
                                          vCarrito![currentIndex].carritoid);
                                    },
                                    habilitado: 0,
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ));
        });
  }
}
