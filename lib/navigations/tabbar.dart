import 'package:flutter/material.dart';
import 'package:spotify_clone/views/home.dart'; // Importa la vista de inicio
import 'package:spotify_clone/views/library.dart'; // Importa la vista de biblioteca
import 'package:spotify_clone/views/profile.dart'; // Importa la vista de perfil
import 'package:spotify_clone/views/search.dart'; // Importa la vista de búsqueda

// Define el widget principal para la barra de navegación
class Tabbar extends StatefulWidget {
  const Tabbar({super.key}); // Constructor de la clase Tabbar

  @override
  State<Tabbar> createState() => _TabbarState(); // Crea el estado de Tabbar
}

// Clase que maneja el estado de la barra de navegación
class _TabbarState extends State<Tabbar> {
  int _selectedTab = 0; // Variable que indica la pestaña seleccionada

  @override
  Widget build(BuildContext context) {
    // El Tabbar es un widget que muestra una barra de navegación inferior
    // con cuatro botones que permiten navegar entre diferentes vistas.
    
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        // Configura la barra de navegación inferior
        currentIndex: _selectedTab, // Indica la pestaña seleccionada actualmente
        onTap: (index) {
          // Método que se ejecuta cuando se selecciona un elemento de la barra de navegación
          setState(() {
            this._selectedTab = index; // Actualiza la pestaña seleccionada
          });
        },
        items: [
          // Elementos de la barra de navegación con íconos y etiquetas
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Ícono de inicio
            label: "Inicio", // Etiqueta de inicio
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_off_outlined), // Ícono de búsqueda
            label: "Buscar", // Etiqueta de búsqueda
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music), // Ícono de biblioteca
            label: "Libreria", // Etiqueta de biblioteca
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Ícono de perfil
            label: "Perfil", // Etiqueta de perfil
          ),
        ],
      ),
      body: Stack(
        // Usa un Stack para superponer las diferentes vistas
        children: [
          // Cada vista se renderiza en una posición del Stack
          renderView(
            0, // Índice de la pestaña para HomeView
            HomeView(), // Vista de inicio
          ),
          renderView(
            1, // Índice de la pestaña para SearchView
            SearchView(), // Vista de búsqueda
          ),
          renderView(
            2, // Índice de la pestaña para LibraryView
            LibraryView(), // Vista de biblioteca
          ),
          renderView(
            3, // Índice de la pestaña para ProfileView
            ProfileView(), // Vista de perfil
          ),
        ],
      ),
    );
  }

  Widget renderView(int tabIndex, Widget views) {
    // Este método muestra u oculta vistas según la pestaña seleccionada
    return IgnorePointer(
      // Ignora los eventos de entrada cuando la vista no está activa
      ignoring: _selectedTab != tabIndex, // Ignora si no es la pestaña activa
      child: Opacity(
        // Controla la opacidad de la vista (visible si es la pestaña activa)
        opacity: _selectedTab == tabIndex ? 1 : 0, // Opacidad 1 si es activa
        child: views, // Muestra el widget de vista correspondiente
      ),
    );
  }
}
