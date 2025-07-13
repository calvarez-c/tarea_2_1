import 'package:aplicacion_login_registro/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  bool? aceptar = false;
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // reduce el body cuando sale el teclado
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 24,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //TITULOS
                      Text(
                        "Registro",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Porfavor ingresa los datos",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      SizedBox(height: 20),

                      //NOMBRE
                      Text(
                        "Nombre",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      CustomTextField(
                        labelText: "Ingresa tu nombre completo",
                        hintText: "",
                        controller: nameController,
                        radius: 12,
                      ),
                      SizedBox(height: 20),

                      //CORREO
                      Text(
                        "Correo",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      CustomTextField(
                        labelText: "Ingrese el correo",
                        hintText: "",
                        controller: emailController,
                        radius: 12,
                      ),
                      SizedBox(height: 20),

                      //NUMERO DE TELEFONO
                      Text(
                        "Telefono",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      CustomTextField(
                        labelText: "Ingrese su numero telefonico",
                        hintText: "",
                        controller: emailController,
                        radius: 12,
                      ),
                      SizedBox(height: 20),

                      //CONTRASENIA
                      Text(
                        "Contraseña",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
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
                            passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: aceptar,
                            onChanged: (bool? newAceptar) {
                              setState(() {
                                //Agregar utilidad
                                aceptar = newAceptar;
                              });
                            },
                          ),
                          Text(
                            "Estoy de acuerdo con compartir mi informacion",
                            style: TextStyle(fontSize: 12),
                          ),
                          Spacer(),
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
                            setState(() {
                              print("logeo");
                            });
                          },
                          child: Text(
                            "Registrarme",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      // SizedBox(height: 10),

                      //SEPARADOR
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(child: Divider()),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              " O ",
                              style: TextStyle(color: Colors.black54),
                            ),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      //SizedBox(height: 150),
                      // Spacer(),
                      //AUXILIAR
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "¿Tienes una cuenta? ",
                            style: TextStyle(fontSize: 16),
                          ),
                          TextButton(
                            onPressed: () {
                              // TODO: navegar a Login
                              print("iniciar sesion");
                            },
                            child: Text(
                              "Inicia Sesion",
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
          },
        ),
      ),
    );
  }
}
