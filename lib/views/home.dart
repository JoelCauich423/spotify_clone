import 'package:flutter/material.dart';
import 'package:spotify_clone/views/album_view.dart';
import 'package:spotify_clone/widgets/song_card.dart';

import '../widgets/album_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .6,
          decoration:  BoxDecoration(
            color:  Color(0xFf1C7A74),
          ),
        ),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
             decoration:  BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end:Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0),
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(1),
                 Colors.black.withOpacity(1),
                Colors.black.withOpacity(1),
                ],
              )
          ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Escuchado recientemente", 
                        style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Row(
                          children: [
                            Icon(Icons.history),
                            SizedBox(width: 16),
                            Icon(Icons.settings),
                          ],
                        )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        AlbumCard(
                          label: "Heavy is th clow", 
                          image: AssetImage("assets/album_1.jpg"), onTap: () {  },
                          
                          ),
                        SizedBox(width: 20),
                        AlbumCard(
                          label: "Standing Next to You", 
                          image: AssetImage("assets/album_2.jpg"), onTap: () {  },
                          
                        ),
                        SizedBox(width: 20),
                        AlbumCard(
                          label: "You Could Be Mine", 
                          image: AssetImage("assets/album_3.jpg"), onTap: () {  },
                          
                        ),
                        SizedBox(width: 20),
                        AlbumCard(
                          label: "Highway to Hell", 
                          image: AssetImage("assets/album_4.jpg"), onTap: () {  },
                          
                        ),
                        SizedBox(width: 20),
                        AlbumCard(
                          label: "I Was Made For Lovin'You", 
                          image: AssetImage("assets/album_5.jpg"), onTap: () {  },
                          
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Buenas Noche",
                           style: Theme.of(context).textTheme.headlineSmall,
                           ),
                        SizedBox( height: 16),
                        Row(
                          children: [
                            RowAlbumCard(
                              label:"Queen",
                              image: AssetImage("assets/album_6.jpg"),
                              ),
                            SizedBox(width: 16),
                            RowAlbumCard(
                              label:"Iron Maiden",
                              image: AssetImage("assets/album_7.jpg"),
                            ),
                          ],
                        ),
                          SizedBox( height: 16),
                         Row(
                          children: [
                            RowAlbumCard(
                              label:"Metalica",
                              image: AssetImage("assets/album_8.jpg"),
                            ),
                            SizedBox(width: 16),
                            RowAlbumCard(
                              label:"Nirvana",
                              image: AssetImage("assets/album_9.jpg"),
                            ),
                          ],
                        ),
                        SizedBox( height: 16),
                         Row(
                          children: [
                            RowAlbumCard(
                              label:"Eminem",
                              image: AssetImage("assets/album_10.jpg"),
                            ),
                            SizedBox(width: 16),
                            RowAlbumCard(
                              label:"Aerosmith",
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
                       Padding(
                         padding: const EdgeInsets.all(16.0),
                         child: Text(
                            "Basado en tu escucha reciente",
                             style: Theme.of(context).textTheme.headlineSmall,
                             ),
                       ),
                       SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          ),
                        child: Row(children: [
                          SongCard(image: AssetImage("assets/album_12.jpg"),),
                          SizedBox(width: 16),
                          SongCard(image: AssetImage("assets/album_15.jpg"),),
                          SizedBox(width: 16),
                          SongCard(image: AssetImage("assets/album_13.jpg"),),
                          SizedBox(width: 16),
                          SongCard(image: AssetImage("assets/album_14.jpg"),),
                          SizedBox(width: 16),
                          SongCard(image: AssetImage("assets/album_16.jpg"),),
                          SizedBox(width: 16),
                          SongCard(image: AssetImage("assets/album_17.jpg"),),
                        ],),
                       )
                    ],
                  ),
            
                  SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Padding(
                         padding: const EdgeInsets.all(16.0),
                         child: Text(
                            "Estaciones recomendadas",
                             style: Theme.of(context).textTheme.headlineSmall,
                             ),
                       ),
                       SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          ),
                        child: Row(children: [
                          SongCard(image: AssetImage("assets/album_18.jpg"),),
                          SizedBox(width: 16),
                          SongCard(image: AssetImage("assets/album_19.jpg"),),
                          SizedBox(width: 16),
                          SongCard(image: AssetImage("assets/album_20.jpg"),),
                          SizedBox(width: 16),
                          SongCard(image: AssetImage("assets/album_21.jpg"),),
                          SizedBox(width: 16),
                          SongCard(image: AssetImage("assets/album_22.jpg"),),
                          SizedBox(width: 16),
                          SongCard(image: AssetImage("assets/album_23.jpg"),),
                        ],),
                       )
                    ],
                  ),
                   SizedBox(height: 16),
                ],
                ),
            ),
          ),
        )
      ],
      ),
    );
  }
}

class RowAlbumCard extends StatelessWidget {
  final AssetImage image;
  final String label;
  const RowAlbumCard({
    super.key, required this.image, required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(4),
          ),
        clipBehavior: Clip.antiAlias,
        child:  Row(
          children: [
            Image(
              image: image, 
              width: 70,
              fit: BoxFit.cover,
              ),
              SizedBox(width: 8),
               Text(label)
          ],
        ),
      ),
    );
  }
}

