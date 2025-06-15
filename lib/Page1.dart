import 'package:flutter/material.dart';
import 'package:project1/BottomNavigationBar.dart';
import 'package:project1/components/glow_button.dart';
import 'package:project1/register.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});
  @override
  State<MyWidget> createState() => _MyWidgetState();
}
class _MyWidgetState extends State<MyWidget> {
  String? nama;
  String? nbi;
  void data() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? _nama = prefs.getString('nama');
    final String? _nbi = prefs.getString('nbi');
    setState(() {
      nama = _nama;
      nbi = _nbi;
    });
  }
  @override
  void initState() {
   
    super.initState();
    data();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome To",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            Text(
              "PRAKTIKUM PAB 2025",
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
            const SizedBox(height: 40),
            Text(
              "$nbi",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            Image.asset("assets/images/welcome.png", width: 200, height: 200),
            Text(
              "$nama",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            GlowButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const BottomNavigationScreen()),
                );
              },
            ),
            const SizedBox(height: 20),
          InkWell(
            onTap: () async {
              final SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.remove('nama');
              await prefs.remove('nbi');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context){
                  return RegisterPage();
                }),
              );
            },
            child: Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 204, 129, 129),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Keluar',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          ],
        ),
      ),
    );
  }
}
