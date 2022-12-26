// ignore_for_file: file_names, camel_case_types

import 'package:carrito_paty/modelo/carrito.dart';

import '../modelo/producto.dart';
import '../modelo/usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class leerDatos {
  Future<Usuario> cargarUsuario(String login, String clave) async {
    final a = await FirebaseFirestore.instance
        .collection('usuario')
        .where("login", isEqualTo: login)
        .where("clave", isEqualTo: clave)
        .get();

    List<Object?> list = a.docs.map((DocumentSnapshot doc) {
      return doc.data();
    }).toList();

    if (list.isEmpty == false) {
      Usuario user = Usuario.fromJson(list[0] as Map<String, dynamic>);

      return user;
    }

    return Usuario(
      usuario: '',
      login: '',
      clave: '',
    );
  }

  Future<carrito> buscarCarrito(String login, String producto) async {
    final a = await FirebaseFirestore.instance
        .collection('carrito')
        .where("usuario", isEqualTo: login)
        .where("producto", isEqualTo: producto)
        .get();

    List<Object?> list = a.docs.map((DocumentSnapshot doc) {
      return doc.data();
    }).toList();

    if (list.isEmpty == false) {
      carrito car = carrito.fromJson(list[0] as Map<String, dynamic>);
      return car;
    }

    return carrito(
      usuario: '',
      cantidad: 0,
      carritoid: '',
      foto: '',
      nombre: '',
      precio: 0,
      producto: '',
      total: 0,
    );
  }

  Stream<List<Producto>> leerProductos() {
    Stream<List<Producto>> a = FirebaseFirestore.instance
        .collection('producto')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Producto.fromJson(doc.data())).toList());

    return a;
  }

  Stream<List<carrito>> leerCarritos(String login) {
    Stream<List<carrito>> a = FirebaseFirestore.instance
        .collection('carrito')
        .where("usuario", isEqualTo: login)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => carrito.fromJson(doc.data())).toList());

    return a;
  }
}
