import 'package:flutter/material.dart';
import 'package:spotify_clone/views/album_view.dart'; // Importa la vista de álbum
import 'package:spotify_clone/widgets/song_card.dart'; // Importa el widget de tarjeta de canción
import '../widgets/album_card.dart'; // Importa el widget de tarjeta de álbum

// Define el widget principal para la vista de inicio
class HomeView extends StatefulWidget {
  const HomeView({super.key}); // Constructor de la clase HomeView

  @override
  State<HomeView> createState() => _HomeViewState(); // Crea el estado de HomeView
}

// Clase que maneja el estado de HomeView
class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          // Fondo de la parte superior
          Container(
            width: MediaQuery.of(context).size.width, // Ancho de la pantalla
            height: MediaQuery.of(context).size.height * .6, // Altura en 60% de la pantalla
            decoration: BoxDecoration(
              color: Color(0xFF1C7A74), // Color de fondo específico
            ),
          ),
          // Contenedor con desplazamiento para la pantalla
          SingleChildScrollView(
            physics: BouncingScrollPhysics(), // Agrega efecto de rebote al desplazarse
            child: Container(
              decoration: BoxDecoration(
                // Gradiente para fondo de la pantalla
                gradient: LinearGradient(
                  begin: Alignment.topCenter, // Comienza desde la parte superior
                  end: Alignment.bottomCenter, // Termina en la parte inferior
                  colors: [
                    Colors.black.withOpacity(0), // Degradado de transparente a negro
                    Colors.black.withOpacity(0.9),
                    Colors.black.withOpacity(1),
                    Colors.black.withOpacity(1),
                    Colors.black.withOpacity(1),
                  ],
                ),
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 40), // Espacio en la parte superior
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20), // Margen horizontal
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Espacio entre elementos
                        children: [
                          // Título de sección "Escuchado recientemente"
                          Text(
                            "Escuchado recientemente",
                            style: Theme.of(context).textTheme.titleLarge, // Estilo de texto
                          ),
                          Row(
                            children: [
                              Icon(Icons.history), // Icono de historial
                              SizedBox(width: 16), // Espacio entre íconos
                              Icon(Icons.settings), // Icono de configuración
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Carrusel horizontal de álbumes
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal, // Dirección de desplazamiento horizontal
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.all(20), // Margen alrededor del carrusel
                      child: Row(
                        children: [
                          AlbumCard(
                            label: "Heavy is the Clown", // Título del álbum
                            image: AssetImage("assets/album_1.jpg"), // Imagen del álbum
                            onTap: () {}, // Acción al hacer clic
                          ),
                          SizedBox(width: 20), // Espacio entre elementos
                          AlbumCard(
                            label: "Standing Next to You",
                            image: AssetImage("assets/album_2.jpg"),
                            onTap: () {},
                          ),
                          SizedBox(width: 20),
                          AlbumCard(
                            label: "You Could Be Mine",
                            image: AssetImage("assets/album_3.jpg"),
                            onTap: () {},
                          ),
                          SizedBox(width: 20),
                          AlbumCard(
                            label: "Highway to Hell",
                            image: AssetImage("assets/album_4.jpg"),
                            onTap: () {},
                          ),
                          SizedBox(width: 20),
                          AlbumCard(
                            label: "I Was Made For Lovin' You",
                            image: AssetImage("assets/album_5.jpg"),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32), // Espacio entre secciones
                    Padding(
                      padding: const EdgeInsets.all(16.0), // Margen alrededor de la sección
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Título de sección "Buenas Noches"
                          Text(
                            "Buenas Noches",
                            style: Theme.of(context).textTheme.headlineSmall, // Estilo de texto
                          ),
                          SizedBox(height: 16), // Espacio debajo del título
                          // Filas de álbumes recomendados
                          Row(
                            children: [
                              RowAlbumCard(
                                label: "Queen",
                                image: AssetImage("assets/album_6.jpg"),
                              ),
                              SizedBox(width: 16),
                              RowAlbumCard(
                                label: "Iron Maiden",
                                image: AssetImage("assets/album_7.jpg"),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              RowAlbumCard(
                                label: "Metallica",
                                image: AssetImage("assets/album_8.jpg"),
                              ),
                              SizedBox(width: 16),
                              RowAlbumCard(
                                label: "Nirvana",
                                image: AssetImage("assets/album_9.jpg"),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              RowAlbumCard(
                                label: "Eminem",
                                image: AssetImage("assets/album_10.jpg"),
                              ),
                              SizedBox(width: 16),
                              RowAlbumCard(
                                label: "Aerosmith",
                                image: AssetImage("assets/album_11.jpg"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Título de sección "Basado en tu escucha reciente"
                        Padding(
                          padding: const EdgeInsets.all(16.0), // Margen alrededor del título
                          child: Text(
                            "Basado en tu escucha reciente",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        // Carrusel de canciones recomendadas
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal, // Desplazamiento horizontal
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              SongCard(image: AssetImage("assets/album_12.jpg")),
                              SizedBox(width: 16),
                              SongCard(image: AssetImage("assets/album_15.jpg")),
                              SizedBox(width: 16),
                              SongCard(image: AssetImage("assets/album_13.jpg")),
                              SizedBox(width: 16),
                              SongCard(image: AssetImage("assets/album_14.jpg")),
                              SizedBox(width: 16),
                              SongCard(image: AssetImage("assets/album_16.jpg")),
                              SizedBox(width: 16),
                              SongCard(image: AssetImage("assets/album_17.jpg")),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Título de sección "Estaciones recomendadas"
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Estaciones recomendadas",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        // Carrusel de estaciones recomendadas
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              SongCard(image: AssetImage("assets/album_18.jpg")),
                              SizedBox(width: 16),
                              SongCard(image: AssetImage("assets/album_19.jpg")),
                              SizedBox(width: 16),
                              SongCard(image: AssetImage("assets/album_20.jpg")),
                              SizedBox(width: 16),
                              SongCard(image: AssetImage("assets/album_21.jpg")),
                              SizedBox(width: 16),
                              SongCard(image: AssetImage("assets/album_22.jpg")),
                              SizedBox(width: 16),
                              SongCard(image: AssetImage("assets/album_23.jpg")),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16), // Espacio final en la pantalla
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget para las tarjetas de álbum en las filas recomendadas
class RowAlbumCard extends StatelessWidget {
  final AssetImage image; // Imagen del álbum
  final String label; // Nombre del álbum

  const RowAlbumCard({
    super.key,
    required this.image,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1, // Ocupa un espacio expandido en la fila
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white10, // Fondo semitransparente
          borderRadius: BorderRadius.circular(4), // Bordes redondeados
        ),
        clipBehavior: Clip.antiAlias, // Define el comportamiento del clip
        child: Row(
          children: [
            Image(
              image: image, // Muestra la imagen del álbum
              width: 70, // Ancho de la imagen
              fit: BoxFit.cover, // Ajuste de imagen
            ),
            SizedBox(width: 8), // Espacio entre imagen y texto
            Text(label), // Nombre del álbum
          ],
        ),
      ),
    );
  }
}
