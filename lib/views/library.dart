import 'package:flutter/material.dart';

// Define el widget LibraryView, que es un StatefulWidget.
class LibraryView extends StatefulWidget {
  const LibraryView({super.key}); // Constructor para LibraryView.

  @override
  State<LibraryView> createState() => _LibraryViewState(); // Crea el estado para LibraryView.
}

// Estado de LibraryView.
class _LibraryViewState extends State<LibraryView> {
  @override
  Widget build(BuildContext context) {
    // Método build que crea la interfaz de usuario.
    return Scaffold(
      // Estructura principal de la pantalla.
      body: Center(
        // Centra el contenido en el medio de la pantalla.
        child: Text("Library Works"), // Texto que se muestra en el centro de la pantalla.
      ),
    );
  }
}
