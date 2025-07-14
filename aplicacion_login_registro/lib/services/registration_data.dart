class RegistrationData {
  final String nombre;
  final String correo;
  final String contrasenia;
  final String telefono;

  RegistrationData._({
    required this.nombre,
    required this.correo,
    required this.contrasenia,
    required this.telefono,
  });

  factory RegistrationData.validateRegister({
    required String nombre,
    required String correo,
    required String contrasenia,
    required String telefono,
  }) {
    _validateNombre(nombre);
    _validateCorreo(correo);
    _validateTelefono(telefono);
    _validateContrasenia(contrasenia);
    return RegistrationData._(
      nombre: nombre,
      correo: correo.trim(),
      contrasenia: contrasenia,
      telefono: telefono.trim(),
    );
  }

  // setNombre(String nombre) {
  //   validateNombre(nombre);
  //   this.nombre = nombre;
  // }

  // setCorreo(String correo) {
  //   validateCorreo(correo);
  //   this.correo = correo.trim();
  // }

  // setTelefono(String telefono) {
  //   validateTelefono(telefono);
  //   this.telefono = telefono.trim();
  // }

  // setContrasenia(String contrasenia) {
  //   validateContrasenia(contrasenia);
  //   this.contrasenia = contrasenia;
  // }
  static void _validateNombre(String nombre) {
    if (nombre.isEmpty) {
      throw Exception("El nombre no puede estar vacio.");
    }
  }

  static void _validateCorreo(String correo) {
    if (correo.trim().isEmpty) {
      throw Exception("El correo no puede estar vacio.");
    }
    if (!correo.endsWith("@unah.hn")) {
      throw Exception("El dominio del correo no es valido.");
    }
  }

  static void _validateTelefono(String telefono) {
    if (!(telefono.trim().length == 8)) {
      throw Exception("La cantidad de digitos en el numero no es valido");
    }
  }

  static void _validateContrasenia(String contrasenia) {
    if (!(contrasenia.length >= 6)) {
      throw Exception(
        "Los caracteres de la contrasenia deben ser mayor o igual a 6.",
      );
    }
    //RegExp(r'[^A-Za-z0-9]') define un patrón que coincide con cualquier caracter que no sea letra (A–Z, a–z) ni dígito (0–9), es decir, símbolos como !, @, #, $, etc.
    //hasMatch(password) devuelve true en cuanto encuentra el primer caracter especial.
    if (RegExp(r'[^A-Za-z0-9]').hasMatch(contrasenia) != true) {
      throw Exception("La contrasenia debe contener caracteres especiales.");
    }
  }
}
