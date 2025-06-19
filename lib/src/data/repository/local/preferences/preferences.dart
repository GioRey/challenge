import 'package:shared_preferences/shared_preferences.dart';

/// Clase para gestionar las preferencias compartidas (almacenamiento local).
///
/// Esta clase proporciona una instancia estática de [SharedPreferences]
/// para facilitar el acceso y almacenamiento de datos localmente en toda la app.
class Preferences {
  /// Instancia global de [SharedPreferences].
  static late SharedPreferences preferences;

  /// Inicializa la instancia de [SharedPreferences].
  ///
  /// Debe llamarse al iniciar la app (por ejemplo, en `main()`) antes de acceder a [preferences].
  static Future<void> initPreferences() async {
    preferences = await SharedPreferences.getInstance();
  }
}
