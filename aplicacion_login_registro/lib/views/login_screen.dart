import 'package:aplicacion_login_registro/data/user_data.dart';
import 'package:aplicacion_login_registro/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

String? _rememberedEmail;
String? _rememberedPassword;

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool? recuerdame = false;
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    if (_rememberedEmail != null && _rememberedPassword != null) {
      emailController.text = _rememberedEmail!;
      passwordController.text = _rememberedPassword!;
      recuerdame = true;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //TITULOS
              Text(
                "Inicio de sesión",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
              ),
              Text(
                "Porfavor ingresa los datos",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 20),

              //CORREO
              Text(
                "Correo",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              CustomTextField(
                labelText: "Ingrese el correo",
                hintText: "",
                controller: emailController,
                radius: 12,
              ),
              SizedBox(height: 20),

              //CONTRASENIA
              Text(
                "Contraseña",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              CustomTextField(
                labelText: "Ingrese su contraseña",
                hintText: "",
                obscureText: !passwordVisible,
                controller: passwordController,
                radius: 12,
                //ESCONDER O MOSTRAR CONTRASENIA
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                  icon: Icon(
                    passwordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),

              //RECUERDAME Y OLVIDE CONTRASENIA
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    value: recuerdame,
                    onChanged: (bool? newRecuerdame) {
                      setState(() {
                        //Agregar utilidad
                        recuerdame = newRecuerdame;
                      });
                    },
                  ),
                  Text("Recordarme", style: TextStyle(fontSize: 16)),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      UserData.showUsers();
                      //TODO: ir a recuperar contrase;a
                    },
                    child: Text(
                      "¿Olvidaste la contraseña?",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              //BOTON DE INICIAR SESION
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.all(
                        Radius.circular(16),
                      ),
                    ),
                    padding: EdgeInsets.all(24),
                  ),
                  onPressed: () {
                    //VALIDACIONES DE DATOS INGRESADOS
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            actionsAlignment: MainAxisAlignment.center,
                            content: Text(
                              "Los datos no pueden ir en blanco.",
                              style: TextStyle(fontSize: 20),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  context.pop();
                                },
                                child: Text(
                                  'Entiendo',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                      return;
                    }

                    if (!emailController.text.contains('@unah.hn')) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            actionsAlignment: MainAxisAlignment.center,
                            title: Text(
                              "Advertencia",
                              // style: TextStyle(color: Colors.red[500]),
                            ),
                            content: Text(
                              "El dominio del correo no es valido.",
                              style: TextStyle(fontSize: 20),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  context.pop();
                                },
                                child: Text(
                                  "Entiendo",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                      return;
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //     content: Text("El correo no es valido"),
                      //     action: SnackBarAction(
                      //       label: "Cerrar",
                      //       onPressed: () {},
                      //     ),
                      //   ),
                      // );
                    }

                    if (!(UserData.auth(
                      emailController.text,
                      passwordController.text,
                    ))) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            actionsAlignment: MainAxisAlignment.center,
                            title: Text(
                              "Advertencia",
                              // style: TextStyle(color: Colors.red[500]),
                            ),
                            content: Text(
                              "Correo y contrasenia incorrectos.",
                              style: TextStyle(fontSize: 20),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  context.pop();
                                },
                                child: Text(
                                  "Entiendo",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                      return;
                    }

                    if (recuerdame == true) {
                      _rememberedEmail = emailController.text;
                      _rememberedPassword = passwordController.text;
                    } else {
                      _rememberedEmail = null;
                      _rememberedPassword = null;
                    }

                    //SI TODO ESTA CORRECTO
                    context.goNamed('home');
                  },
                  child: Text("Iniciar sesion", style: TextStyle(fontSize: 18)),
                ),
              ),

              //SEPARADOR
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(" O ", style: TextStyle(color: Colors.black54)),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              Spacer(),

              //AUXILIAR
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "¿No tienes una cuenta? ",
                    style: TextStyle(fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: navegar a Registro
                      context.goNamed('register');
                      print("registrarse");
                    },
                    child: Text(
                      "Registrarse",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
