import 'package:flutter/material.dart';

class SongCard extends StatelessWidget {
  final AssetImage image;

  const SongCard({
    Key? key, 
    required this.image,
    }): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      child: Column(children: [
        Image(
        image: image,
        width: 210,
        height: 210,
        ),
        Text("Rammstein, Mago de Oz, Jungkook, Imagine Dragons, Metro Booming, One Republic", style: Theme.of(context).textTheme.bodySmall,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        )
      ],),
    );
  }
}