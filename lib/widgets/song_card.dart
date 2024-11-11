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
    return GestureDetector(
       onTap: (){
                            Navigator.push(
                             context, 
                             MaterialPageRoute(
                              builder: (context) => AlbumView(image: image),
                              ),
                            );
                          }, 
      child: Container(
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
      ),
    );
  }
}