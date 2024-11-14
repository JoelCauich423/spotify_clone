import 'package:flutter/material.dart';
import 'package:spotify_clone/navigations/tabbar.dart';

// Función principal que inicializa la aplicación MyApp
void main() {
  runApp(MyApp());
}

// Definición del widget MyApp, que es un StatefulWidget (con estado)
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState(); // Crea y devuelve el estado asociado a MyApp
}

// Clase que define el estado de MyApp
class _MyAppState extends State<MyApp> {
  // Método build para construir la interfaz de la aplicación
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Oculta el banner de "Debug" en la esquina superior derecha
      themeMode: ThemeMode.dark, // Configura el modo oscuro como el modo de tema activo

      // Define el tema oscuro de la aplicación
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black, // Establece el color de fondo negro para las pantallas
        brightness: Brightness.dark, // Configura la aplicación en modo oscuro

        // Configuración para la barra de navegación inferior
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white10, // Color de fondo de la barra de navegación
          selectedLabelStyle: TextStyle(
            fontSize: 12, // Tamaño de fuente para el texto de los elementos seleccionados
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 12, // Tamaño de fuente para el texto de los elementos no seleccionados
          ),
          selectedItemColor: Colors.white, // Color de los elementos seleccionados
          unselectedItemColor: Colors.white38, // Color de los elementos no seleccionados
          type: BottomNavigationBarType.fixed, // Tipo fijo para mantener los iconos en su lugar
        ),
      ),
      home: const Tabbar(), // Define la pantalla de inicio de la aplicación, en este caso el widget Tabbar
    );
  }
}
