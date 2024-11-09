import 'package:flutter/material.dart';

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
          height: MediaQuery.of(context).size.height * .44,
          decoration:  BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end:Alignment.bottomCenter,
              colors: [
                Colors.white.withOpacity(0.5),
                Colors.white.withOpacity(0.1),
                Colors.black.withOpacity(0)
                ],
              )
          ),
        ),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
                      Text("Played reciente", 
                      style: Theme.of(context).textTheme.headlineMedium,
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
                        label: "From Zero", 
                        image: AssetImage("assets/album_1.jpg"),
                        ),
                      SizedBox(width: 20),
                      AlbumCard(
                        label: "Top 1", 
                        image: AssetImage("assets/album_2.jpg"),
                      ),
                      SizedBox(width: 20),
                      AlbumCard(
                        label: "Best Mode", 
                        image: AssetImage("assets/album_3.jpg"),
                      ),
                      SizedBox(width: 20),
                      AlbumCard(
                        label: "Top 50 Gblobales", 
                        image: AssetImage("assets/album_4.jpg"),
                      ),
                      SizedBox(width: 20),
                      AlbumCard(
                        label: "Best Rock", 
                        image: AssetImage("assets/album_5.jpg"),
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
                        "Buena Noche",
                         style: Theme.of(context).textTheme.headlineMedium,
                         ),
                      SizedBox( height: 16),
                      Row(
                        children: [
                          Container(
                            child:  Row(
                              children: [
                                Image(
                                  image: AssetImage("assets/album_6.jpg"), height: 60, 
                                  width: 60, 
                                  fit: BoxFit.cover,
                                  )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
              ),
          ),
        )
      ],
      ),
    );
  }
}

