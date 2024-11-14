import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone/widgets/album_card.dart';

// Define el widget AlbumView, el cual es un StatefulWidget
class AlbumView extends StatefulWidget {
  final ImageProvider image; // Proveedor de imagen pasado como parámetro

  const AlbumView({super.key, required this.image});

  @override
  State<AlbumView> createState() => _AlbumViewState();
}

// Estado del widget AlbumView
class _AlbumViewState extends State<AlbumView> {
  late ScrollController scrollController; // Controlador para el scroll
  double imageSize = 0; // Tamaño de la imagen de portada que cambia al hacer scroll
  double initialSize = 240; // Tamaño inicial de la imagen
  double containerHeight = 500; // Altura del contenedor superior
  double containerinitalHeight = 500; // Altura inicial del contenedor superior
  double imageOpacity = 1; // Opacidad de la imagen de portada
  bool showTopBar = false; // Bandera para mostrar u ocultar la barra superior

  @override
  void initState() {
    // Inicializa el tamaño de la imagen de portada
    imageSize = initialSize;
    scrollController = ScrollController()
      ..addListener(() {
        // Cambia el tamaño de la imagen en función del desplazamiento del scroll
        imageSize = initialSize - scrollController.offset;
        if (imageSize < 0) {
          imageSize = 0; // Evita que el tamaño sea negativo
        }

        // Cambia la altura del contenedor superior al hacer scroll
        containerHeight = containerinitalHeight - scrollController.offset;
        if (containerHeight < 0) {
          containerHeight = 0; // Evita que la altura sea negativa
        }

        // Calcula la opacidad de la imagen
        imageOpacity = imageSize / initialSize;

        // Muestra u oculta la barra superior dependiendo de la posición del scroll
        if (scrollController.offset > 224) {
          showTopBar = true;
        } else {
          showTopBar = false;
        }
        setState(() {}); // Actualiza la interfaz
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cardSize = MediaQuery.of(context).size.width / 2 - 32; // Tamaño de las tarjetas de álbum
    return Scaffold(
      body: Stack(
        children: [
          // Contenedor con la imagen de fondo
          Container(
            height: containerHeight,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            color: Colors.purple,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Imagen de portada con opacidad controlada
                Opacity(
                  opacity: imageOpacity.clamp(0, 1.0),
                  child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.5),
                        offset: Offset(0, 20),
                        blurRadius: 32,
                        spreadRadius: 16,
                      )
                    ]),
                    child: Image(
                      image: widget.image,
                      width: imageSize,
                      height: imageSize,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
          ),

          // Contenedor con el contenido principal que se desplaza
          SafeArea(
            child: SingleChildScrollView(
              controller: scrollController,
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  // Contenedor con gradiente de fondo
                  Container(
                    clipBehavior: Clip.none,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(.59),
                          Colors.black.withOpacity(1),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          SizedBox(height: initialSize + 132),
                          Padding(
                            padding: const EdgeInsets.all(19.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Texto descriptivo
                                Text(
                                  "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto.",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    // Icono de Spotify
                                    Image(
                                      image: AssetImage("assets/LogoSpotify.png"),
                                      width: 40,
                                      height: 40,
                                    ),
                                    SizedBox(width: 8),
                                    Text("Spotify"),
                                  ],
                                ),
                                SizedBox(height: 16),
                                Text(
                                  "1,888,132 me gustas 5h 3m",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                SizedBox(height: 16),
                                // Íconos de interacción
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.favorite),
                                        SizedBox(width: 16),
                                        Icon(Icons.more_horiz),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Contenedor con información adicional
                  Container(
                    padding: EdgeInsets.all(16),
                    color: Colors.black,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto...",
                        ),
                        SizedBox(height: 32),
                        Text(
                          "También te puede interesar",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AlbumCard(
                                size: cardSize,
                                label: "Get Turns",
                                image: AssetImage("assets/album_24.jpg"),
                                onTap: () {},
                              ),
                              AlbumCard(
                                size: cardSize,
                                label: "Get Turns",
                                image: AssetImage("assets/album_25.jpg"),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                        // Repetición de álbumes recomendados
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AlbumCard(
                                size: cardSize,
                                label: "Get Turns",
                                image: AssetImage("assets/album_26.jpg"),
                                onTap: () {},
                              ),
                              AlbumCard(
                                size: cardSize,
                                label: "Get Turns",
                                image: AssetImage("assets/album_27.jpg"),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AlbumCard(
                                size: cardSize,
                                label: "Get Turns",
                                image: AssetImage("assets/album_28.jpg"),
                                onTap: () {},
                              ),
                              AlbumCard(
                                size: cardSize,
                                label: "Get Turns",
                                image: AssetImage("assets/album_29.jpg"),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    height: 1000,
                  ),
                ],
              ),
            ),
          ),

          // Barra superior animada que cambia de color al hacer scroll
          Positioned(
            child: Container(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 250),
                color: showTopBar ? Color(0xFF9b27af).withOpacity(1) : Color(0xFF9b27af).withOpacity(0),
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: SafeArea(
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        // Botón de retroceso
                        Positioned(
                          left: 0,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.keyboard_arrow_left,
                              size: 42,
                            ),
                          ),
                        ),
                        // Título de la barra superior que aparece al hacer scroll
                        AnimatedOpacity(
                          duration: Duration(milliseconds: 250),
                          opacity: showTopBar ? 1 : 0,
                          child: Text(
                            "Rosé & Bruno Mars",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        // Botón de reproducción con shuffle
                        Positioned(
                          right: 0,
                          bottom: -10 - containerHeight.clamp(30.0, double.infinity),
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                width: 64,
                                height: 64,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Icon(
                                  Icons.play_arrow,
                                  size: 40,
                                ),
                              ),
                              Positioned(
                                right: -8,
                                bottom: -2,
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Icon(
                                    Icons.shuffle,
                                    size: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
