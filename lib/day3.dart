//Lodhi Sarma 1462200162
import 'package:flutter/material.dart';

class Day3 extends StatelessWidget {
  const Day3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("DAY 3"),centerTitle: true,),
      body: Column(
        children: [
          Image.asset("assets/img/dolar3.jpeg", width: 350),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, Sed do euismod tempor incididunt ut labore et dolore magna aliqua.",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text("ini adalah menu pop up"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Batal"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("ok"),
                      ),
                  ],
                ),
              );
            },
            child: const Text("Add To Card"),
          ),
        ],
      ),
    );
  }
}
