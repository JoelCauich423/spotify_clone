import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
      containerHeight = containerinitalHeight + scrollController.offset;
      if(containerHeight < 0){
        containerHeight = 0;
      }
      imageOpacity = imageSize / initialSize;
      setState(() {});
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
                  child: Container(
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
                              ),
                ),
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
                          Colors.black.withOpacity(1),
                        ]),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Column(
                        children:[
                        SizedBox(height: initialSize + 132),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. ",
                                style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                SizedBox(height: 8),
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
                                      Positioned(
                                        right: 0,
                                        bottom: 0,
                                        child: Stack(
                                          alignment: Alignment.bottomRight,
                                          children:[ Container(
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
                                  )
                              ],
                            ),
                          )
                      ],
                      ),
                    ),
                  ),
                  Container(
                    color:  Colors.black,
                    height: 1000,
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