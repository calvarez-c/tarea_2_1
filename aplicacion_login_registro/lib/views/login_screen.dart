import 'package:aplicacion_login_registro/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

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
                    setState(() {
                      print("logeo");
                    });
                  },
                  child: Text("Iniciar sesion", style: TextStyle(fontSize: 18)),
                ),
              ),
              SizedBox(height: 10),

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
              SizedBox(height: 150),

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
            ],
          ),
        ),
      ),
    );
  }
}
