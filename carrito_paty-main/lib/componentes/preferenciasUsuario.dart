// ignore_for_file: file_names, non_constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  setUsuario(String Usuario) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('Usuario', Usuario);
  }

  getUsuario() async {
    final SharedPreferences prefs = await _prefs;
    String? intValue = prefs.getString('Usuario');
    return intValue ?? 0;
  }

  setLogin(String Login) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('Login', Login);
  }

  getLogin() async {
    final SharedPreferences prefs = await _prefs;
    String? intValue = prefs.getString('Login');
    return intValue ?? 0;
  }
}
