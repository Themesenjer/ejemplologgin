import 'package:flutter/material.dart';

class AppLogin extends StatefulWidget {
  const AppLogin({super.key});

  @override
  State<AppLogin> createState() => _AppLoginState();
}

class _AppLoginState extends State<AppLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100], // Un color de fondo más agradable
      body: Center( // Centra el contenido en la pantalla
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle, // Hace que el contenedor sea un círculo
            color: Colors.white, // Fondo blanco para el círculo
            border: Border.all(
              color: Colors.blueAccent, // Color del borde
              width: 5.0, // Ancho del borde
            ),
            boxShadow: [ // Agrega una sombra sutil para un efecto "chevere"
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, 3), // Desplazamiento de la sombra
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 100.0,
            backgroundImage: AssetImage("images/Lobo1.jpg"),
          ),
        ),
      ),
    );
  }
}