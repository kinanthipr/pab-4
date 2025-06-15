import 'package:flutter/material.dart';
import 'package:project1/Page1.dart';
import 'package:project1/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5),() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? nama = prefs.getString('nama');
      final String? nbi = prefs.getString('nbi');
      final String? email = prefs.getString('email');
      final String? alamat = prefs.getString('alamat');
      final String? akun = prefs.getString('akun');
      if(nama != null && nbi != null && email != null && alamat != null && akun != null) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (build) {
          return MyWidget();
            },
          ),
        );
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (build) {
          return RegisterPage();
            },
          ),
        );
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xff01500D),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/bunga.png", scale: 2,),
            Image.asset("assets/images/orang.png", scale: 3,),
          ]
        ),
      ),
    );
  }
}