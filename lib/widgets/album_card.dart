import 'package:flutter/widgets.dart';

class AlbumCard extends StatelessWidget {
  final ImageProvider image;
  final String label;
  const AlbumCard({
    super.key, required this.image, required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(image: image, width: 150, height: 150, fit: BoxFit.cover,),
        SizedBox(height: 10),
        Text(label),
      ],
    );
  }
}