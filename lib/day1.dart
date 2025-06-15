//Lodhi Sarma 1462200162
import 'package:flutter/material.dart';
import 'package:project1/components/ListMusic.dart';
class Day1 extends StatelessWidget {
  const Day1({super.key});
  @override
  Widget build(BuildContext context) {
      List music = [
        {"img" : "assets/img/dolar1.jpeg", "txt": "Love Story - Indila"},
        {"img" : "assets/img/dolar2.jpeg", "txt": "Zaz - Je Veux"},
        {"img" : "assets/img/dolar3.jpeg", "txt": "Stromae - Paaoutai"},
        {"img" : "assets/img/dolar4.jpeg", "txt": "Joyce Jonathan - Ca Ira"},
      ];
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: SizedBox(
              width: 400,
              height: 640,
              child: ListView.builder(
                itemCount: music.length,
                itemBuilder: (context, index){
                return listMusic(
                  context: context,
                  img: music[index]["img"],
                  txt : music[index]["txt"]
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
