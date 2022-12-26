// ignore_for_file: camel_case_types

class carrito {
  final String producto;
  final String nombre;
  final double precio;
  double cantidad;
  double total;
  final String foto;
  final String usuario;
  String carritoid;

  carrito({
    required this.producto,
    required this.nombre,
    required this.precio,
    required this.cantidad,
    required this.total,
    required this.foto,
    required this.usuario,
    required this.carritoid,
  });

  Map<String, dynamic> toJson() => {
        'producto': producto,
        'nombre': nombre,
        'precio': precio,
        'cantidad': cantidad,
        'total': total,
        'foto': foto,
        'usuario': usuario,
        'carritoid': carritoid,
      };

  factory carrito.fromJson(Map<String, dynamic> json) {
    return carrito(
      producto: json['producto'],
      nombre: json['nombre'],
      precio: json['precio'].toDouble(),
      cantidad: json['cantidad'].toDouble(),
      total: json['total'].toDouble(),
      foto: json['foto'],
      usuario: json['usuario'],
      carritoid: json['carritoid'],
    );
  }
}
