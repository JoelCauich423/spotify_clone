import 'package:flutter/material.dart';

// Define el widget ProfileView, que es un StatefulWidget.
class ProfileView extends StatefulWidget {
  const ProfileView({super.key}); // Constructor de ProfileView.

  @override
  State<ProfileView> createState() => _ProfileViewState(); // Crea el estado para ProfileView.
}

// Define el estado de ProfileView.
class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    // Método build que construye la interfaz de usuario.
    return Scaffold(
      // Estructura principal de la pantalla.
      body: Center(
        // Centra el contenido en el medio de la pantalla.
        child: Text("Profile Works"), // Texto que se muestra en el centro de la pantalla.
      ),
    );
  }
}
