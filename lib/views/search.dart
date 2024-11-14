import 'package:flutter/material.dart';

// Define el widget SearchView, que es un StatefulWidget.
class SearchView extends StatefulWidget {
  const SearchView({super.key}); // Constructor de SearchView.

  @override
  State<SearchView> createState() => _SearchViewState(); // Crea el estado para SearchView.
}

// Define el estado de SearchView.
class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    // Método build que construye la interfaz de usuario.
    return Scaffold(
      // Estructura principal de la pantalla.
      body: Center(
        // Centra el contenido en el medio de la pantalla.
        child: Text("Search Works"), // Texto que se muestra en el centro de la pantalla.
      ),
    );
  }
}
