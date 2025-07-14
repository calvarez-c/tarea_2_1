import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Bienvenido ! ", style: TextStyle(fontSize: 32)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image(image: AssetImage('./assets/waveAvatar.png')),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: FloatingActionButton(
                onPressed: () {
                  context.goNamed("login");
                },
                backgroundColor: Colors.indigo.shade500,
                child: Text(
                  "Cerrar sesion",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
