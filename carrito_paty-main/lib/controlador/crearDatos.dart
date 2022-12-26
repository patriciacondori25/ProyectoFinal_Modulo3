// ignore_for_file: camel_case_types, avoid_function_literals_in_foreach_calls

import 'package:carrito_paty/modelo/usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../modelo/carrito.dart';

class crearDatos {
  Future<String> createCarrito(carrito car) async {
    String producto = car.producto;

    final a = await FirebaseFirestore.instance
        .collection('carrito')
        .where("usuario", isEqualTo: car.usuario)
        .where("producto", isEqualTo: producto)
        .get();

    List<Object?> list = a.docs.map((DocumentSnapshot doc) {
      return doc.data();
    }).toList();

    if (list.isNotEmpty) {
      final aa = FirebaseFirestore.instance
          .collection('carrito')
          .where("usuario", isEqualTo: car.usuario)
          .where("producto", isEqualTo: producto)
          .get();

      carrito car1 = carrito.fromJson(list[0] as Map<String, dynamic>);

      car.cantidad = car.cantidad + 1;
      car.total = car.total + car.precio;
      car.carritoid = car1.carritoid;

      await aa.then((value) => value.docs.forEach((element) {
            element.reference.update(car.toJson());
          }));
      return car1.carritoid;
    } else {
      final carritodb = FirebaseFirestore.instance.collection('carrito').doc();
      car.carritoid = carritodb.id;
      await carritodb.set(car.toJson());
      return carritodb.id;
    }
  }

  Future<String> createUsuario(Usuario user) async {
    final usuariodb = FirebaseFirestore.instance.collection('usuario').doc();
    user.usuario = usuariodb.id;
    await usuariodb.set(user.toJson());
    return usuariodb.id;
  }
}
