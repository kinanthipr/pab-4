//Lodhi Sarma - 1462200162
import 'package:flutter/material.dart';
Center listMusic({required BuildContext context, required String img, required String txt}) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: 430,
        decoration: BoxDecoration(
          color: const Color(0xFF00BCD4).withOpacity(0.7),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            const BoxShadow(
              color: Color(0xff000000),
              blurRadius: 10,
              offset: Offset(0, 0),
              spreadRadius: -6,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 15),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  img,
                  width: 350,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  txt,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
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
                          child: const Text("OK"),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text("Add To Card"),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
