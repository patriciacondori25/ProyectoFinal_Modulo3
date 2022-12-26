import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: camel_case_types
class borrarDatos {
  void borrarCarrito(String id) async {
    FirebaseFirestore.instance.collection('carrito').doc(id).delete();
  }
}
