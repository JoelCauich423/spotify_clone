import 'package:flutter/material.dart';
import 'package:spotify_clone/views/home.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({super.key});

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined), 
          label: "Inicio",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_off_outlined), 
          label: "Buscar",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined), 
          label: "Holis",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined), 
          label: "Holis",
        ),
      ],
       ),
      body: HomeView(),
    );
  }
}