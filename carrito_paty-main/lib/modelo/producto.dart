class Producto {
  final String codigo;
  final String foto;
  final String nombre;
  final double precio;
  final String producto;

  Producto(
      {required this.codigo,
      required this.foto,
      required this.nombre,
      required this.precio,
      required this.producto});

  Map<String, dynamic> toJson() => {
        'codigo': codigo,
        'foto': foto,
        'nombre': nombre,
        'precio': precio,
        'producto': producto,
      };

  factory Producto.fromJson(Map<String, dynamic> jsonData) {
    return Producto(
      codigo: jsonData['codigo'],
      foto: jsonData['foto'],
      nombre: jsonData['nombre'],
      precio: jsonData["precio"].toDouble(),
      producto: jsonData["producto"],
    );
  }
}
