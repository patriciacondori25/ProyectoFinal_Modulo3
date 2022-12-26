class Usuario {
  String usuario;
  final String login;
  final String clave;

  Usuario({
    required this.usuario,
    required this.login,
    required this.clave,
  });

  Map<String, dynamic> toJson() => {
        'usuario': usuario,
        'login': login,
        'clave': clave,
      };

  static Usuario fromJson(Map<String, dynamic> json) => Usuario(
        usuario: json['usuario'],
        login: json['login'],
        clave: json['clave'],
      );
}
