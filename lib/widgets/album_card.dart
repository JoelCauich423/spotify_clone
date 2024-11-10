import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spotify_clone/views/album_view.dart';

class AlbumCard extends StatelessWidget {
  final ImageProvider image;
  final String label;
  final GestureTapCallback onTap; // Cambiado de Function a GestureTapCallback

  const AlbumCard({
    super.key,
    required this.image,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,  // Ahora esto funcionará correctamente
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: image,
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          Text(label),
        ],
      ),
    );
  }
}