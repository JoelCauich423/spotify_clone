import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone/widgets/album_card.dart';

class AlbumView extends StatefulWidget {
  const AlbumView({super.key});

  @override
  State<AlbumView> createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {
  late ScrollController scrollController;
  double imageSize = 0;
  double initialSize = 240;
  double containerHeight = 500;
  double containerinitalHeight = 500;
  double imageOpacity = 1;
  bool showTopBar = false;
  @override
  void initState() {
    imageSize = initialSize;
    scrollController = ScrollController()
    ..addListener((){
      imageSize = initialSize - scrollController.offset;
      print(imageSize);
      if (imageSize < 0){
        imageSize = 0;
      }
      containerHeight = containerinitalHeight - scrollController.offset;
      if(containerHeight < 0){
        containerHeight = 0;
      }
      imageOpacity = imageSize / initialSize;
      if(scrollController.offset > 224){
        showTopBar = true;
      }else{
        showTopBar = false;
      }
      print(scrollController.offset);
      setState(() {});
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final cardSize = MediaQuery.of(context).size.width /2 - 32;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: containerHeight,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            color: Colors.purple,
            child: Column(
              mainAxisAlignment:  MainAxisAlignment.center, 
              children: [
                Opacity(
                  opacity: imageOpacity.clamp(0, 1.0),
                  child: 
                  Container(
                   decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(.5),
                                    offset:  Offset(0, 20),
                                    blurRadius: 32,
                                    spreadRadius: 16,
                                  )
                                ],
                                ),
                                child: Image(
                                  image: AssetImage("assets/album_24.jpg"),
                                  width: imageSize,
                                  height: imageSize,
                                  fit: BoxFit.cover,
                                  ),
                              ), ),
                                  SizedBox(height: 100,)
                            ],
                       ),
                   ),
          SafeArea(
            child: SingleChildScrollView(
              controller: scrollController,
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    clipBehavior: Clip.none,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end:  Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(.59),
                          Colors.black.withOpacity(1),
                        ]),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children:[
                        SizedBox(height: initialSize + 132),
                          Padding(
                            padding: const EdgeInsets.all(19.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. ",
                                style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Image(
                                      image: AssetImage("assets/LogoSpotify.png"), 
                                      width: 40, 
                                      height: 40,
                                      ),
                                      SizedBox(width: 8),
                                    Text(" Spotify")
                                  ],
                                ),
                                SizedBox(height: 16),
                                Text(
                                  "1,888,132 me gustas 5h 3m", 
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  SizedBox(height: 16),
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
                                  )
                              ],
                            ),
                          )
                      ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    color:  Colors.black,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text(
                        "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500,"),
                        SizedBox(height: 32,),
                         Text("También te puede interesar", 
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
                                image: AssetImage("assets/album_30.jpg"), onTap: () {  },
                                ),
                                AlbumCard(
                                size: cardSize,
                                label: "Get Turns", 
                                image: AssetImage("assets/album_25.jpg"), onTap: () {  },
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
                                image: AssetImage("assets/album_26.jpg"), onTap: () {  },
                                ),
                                AlbumCard(
                                size: cardSize,
                                label: "Get Turns", 
                                image: AssetImage("assets/album_27.jpg"), onTap: () {  },
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
                                image: AssetImage("assets/album_28.jpg"), onTap: () {  },
                                ),
                                AlbumCard(
                                size: cardSize,
                                label: "Get Turns", 
                                image: AssetImage("assets/album_29.jpg"), onTap: () {  },
                                ),
                            ],
                          ),
                        )
                    ],),
                    height: 1000,
                  )
                ],
              ),
            ),
          ),
        //app bar
        Positioned(
          child: Container(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 250),
              color: showTopBar ? Color(0xFF9b27af).withOpacity(1) 
              : Color(0xFF9b27af).withOpacity(0),
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
                      Positioned(
                        left: 0,
                        child: IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.keyboard_arrow_left),
                          ),
                      ),
                      AnimatedOpacity(
                        duration: Duration(milliseconds: 250),
                        opacity: showTopBar ? 1 : 0,
                        child: Text(
                          "Rosé & Bruno Mars",
                          style: Theme.of(context).textTheme.headlineSmall,
                          ),
                      ),
                        Positioned(
                                          right: 0,
                                          bottom: 
                                          -10 - containerHeight.clamp(120.0, double.infinity),
                                          child: Stack(
                                            alignment: Alignment.bottomRight,
                                            children:[ 
                                          Container(
                                              width: 64,
                                              height: 64,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xff14D860),
                                                ),
                                                child: Icon(
                                                  Icons.play_arrow,
                                                  size: 60,
                                                  ),
                                            ),
                                            Container(
                                              width: 26,
                                              height: 26,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white,
                                                ),
                                                child: Icon(
                                                  Icons.shuffle,
                                                  color:  Colors.black,
                                                  size: 26,
                                                  ),
                                            )
                                            ]
                                          ),
                                        )
                          ],
                        ),
                ),
              ),
            ),))
        ],
        ),
    );
  }
}