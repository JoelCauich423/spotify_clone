import 'package:flutter/material.dart';
import 'package:spotify_clone/views/album_view.dart';

class SongCard extends StatelessWidget {
  final AssetImage image;

  const SongCard({
    Key? key, 
    required this.image,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    // El SongCard es un widget personalizado que muestra la imagen de la portada
    // del álbum y una descripción de texto, y navega a la vista AlbumView cuando se hace clic.

    return GestureDetector(
      // Envuelve el contenido en un GestureDetector para manejar los toques
      onTap: () {
        // Cuando se hace clic en el SongCard, se navega a la vista AlbumView
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => AlbumView(image: image),
          ),
        );
      }, 
      child: Container(
        // El SongCard está contenido dentro de un widget Container
        width: 210,
        child: Column(children: [
          // El SongCard contiene un widget Image para la portada del álbum
          Image(
            image: image,
            width: 210,
            height: 210,
          ),
          // El SongCard también contiene un widget Text para la descripción de la canción/artista
          Text(
            "Rammstein, Mago de Oz, Jungkook, Imagine Dragons, Metro Booming, One Republic",
            style: Theme.of(context).textTheme.bodySmall,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          )
        ]),
      ),
    );
  }
}