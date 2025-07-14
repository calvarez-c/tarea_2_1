import 'package:aplicacion_login_registro/services/registration_data.dart';

class UserData {
  static final List<RegistrationData> _users = [
    RegistrationData.validateRegisterWithOutPassword(
      nombre: "Carlos Alvarez",
      correo: "alfredo.alvarez@unah.hn",
      contrasenia: "20222030195",
      telefono: "97209636",
    ),
  ];

  static void addUser(RegistrationData user) {
    _users.add(user);
  }

  static void showUsers() {
    _users.forEach((element) {
      print(
        "Nombre:${element.nombre} Correo:${element.correo} Telefono:${element.telefono} Contrasenia:${element.contrasenia} ",
      );
    });
  }

  static bool auth(String correo, String contrasenia) {
    return _users.any(
      (user) => user.correo == correo && user.contrasenia == contrasenia,
    );
  }
}
