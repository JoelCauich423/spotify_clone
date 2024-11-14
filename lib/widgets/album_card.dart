import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spotify_clone/views/album_view.dart';

// Definición del widget AlbumCard, que es un widget sin estado (StatelessWidget) para representar una tarjeta de álbum
class AlbumCard extends StatelessWidget {
  // Propiedad que almacena la imagen del álbum
  final ImageProvider image;
  // Propiedad que almacena el nombre o título del álbum
  final String label;
  // Callback que se ejecuta al tocar la tarjeta
  final GestureTapCallback onTap; // Cambiado de Function a GestureTapCallback
  // Tamaño de la tarjeta, con un valor por defecto de 150
  final double size;

  // Constructor de AlbumCard que recibe image, label, onTap como requeridos, y size opcional
  const AlbumCard({
    super.key,
    required this.image,
    required this.label,
    required this.onTap,
    this.size = 150,
  });

  // Método que construye el widget visualmente
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Al tocar el álbum, se navega hacia AlbumView y se le pasa la imagen como parámetro
      onTap: (){
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => AlbumView(image: image),
          ),
        );
      },  // Ahora esto funcionará correctamente

      // Estructura visual de la tarjeta, compuesta por una imagen y un texto
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Alinea el contenido de la columna hacia la izquierda
        children: [
          // Muestra la imagen del álbum con el tamaño especificado y el ajuste (BoxFit.cover)
          Image(
            image: image,
            width: size,
            height: size,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10), // Espacio vertical entre la imagen y el texto
          Text(label), // Muestra el texto del título del álbum
        ],
      ),
    );
  }
}
