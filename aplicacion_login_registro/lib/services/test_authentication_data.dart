class AuthenticationData {
  final String nombre;
  final String correo;
  final String contrasenia;
  final String telefono;

  // Constructor privado
  AuthenticationData._({
    required this.nombre,
    required this.correo,
    required this.contrasenia,
    required this.telefono,
  });

  /// Fabrica una instancia validada o lanza Exception
  factory AuthenticationData.register({
    required String nombre,
    required String correo,
    required String contrasenia,
    required String telefono,
  }) {
    if (nombre.trim().isEmpty) {
      throw Exception("El nombre no puede estar vacío.");
    }
    if (correo.trim().isEmpty) {
      throw Exception("El correo no puede estar vacío.");
    }
    if (!correo.endsWith("@unah.hn")) {
      throw Exception("El correo debe terminar en @unah.hn.");
    }
    if (telefono.trim().length != 8) {
      throw Exception("El teléfono debe tener 8 dígitos.");
    }
    if (contrasenia.length < 6) {
      throw Exception("La contraseña debe tener al menos 6 caracteres.");
    }
    if (!RegExp(r'[^A-Za-z0-9]').hasMatch(contrasenia)) {
      throw Exception("La contraseña debe contener un carácter especial.");
    }

    return AuthenticationData._(
      nombre: nombre.trim(),
      correo: correo.trim(),
      contrasenia: contrasenia,
      telefono: telefono.trim(),
    );
  }
}
