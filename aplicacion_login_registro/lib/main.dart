import 'package:aplicacion_login_registro/views/home_screen.dart';
import 'package:aplicacion_login_registro/views/login_screen.dart';
import 'package:aplicacion_login_registro/views/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(
        initialLocation: '/login',
        routes: [
          GoRoute(
            name: 'home',
            path: '/home',
            builder: (context, state) {
              return HomeScreen();
            },
          ),
          GoRoute(
            name: 'login',
            path: '/login',
            builder: (context, state) {
              return LoginScreen();
            },
            routes: [
              GoRoute(
                name: 'register',
                path: '/register',
                builder: (context, state) {
                  return RegisterScreen();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
