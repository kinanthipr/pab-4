import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project1/register.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}
class _ProfilePageState extends State<ProfilePage> {
  String? nama;
  String? nbi;
  String? email;
  String? alamat;
  String? akun;
  void data() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? _nama = prefs.getString('nama');
    final String? _nbi = prefs.getString('nbi');
    final String? _email = prefs.getString('email');
    final String? _alamat = prefs.getString('alamat');
    final String? _akun = prefs.getString('akun');
    setState(() {
      nama = _nama;
      nbi = _nbi;
      email = _email;
      alamat = _alamat;
      akun = _akun;
    });
  }
  @override
  void initState() {
   
    super.initState();
    data();
  }
  @override
  Widget build(BuildContext context) {
    Color iconColor = Colors.blue;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // AppBar melengkung
          Stack(
            children: [
              ClipPath(
                clipper: ExtraDeepClipper(),
                child: Container(
                  height: 250,
                  color: Colors.cyan,
                  alignment: Alignment.center,
                  child: const Padding(
                    padding: EdgeInsets.only(top: 70),
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 180,
                left: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 45,
                    color: iconColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 75),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children:  [
                  InfoRow(icon: Icons.person, text: "$nama"),
                  InfoRow(icon: Icons.phone, text: "$nbi"),
                  InfoRow(icon: Icons.email, text: "$email"),
                  InfoRow(icon: Icons.location_on, text: "$alamat"),
                  InfoRow(icon: FontAwesomeIcons.instagram, text: "$akun"),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              final SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.remove('nama');
              await prefs.remove('nbi');
              await prefs.remove('email');
              await prefs.remove('alamat');
              await prefs.remove('akun');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context){
                  return RegisterPage();
                }),
              );
            },
            child: Container(
              width: 250,
              height: 50,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 160, 76, 76),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  'Keluar',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  const InfoRow({super.key, required this.icon, required this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.blue, size: 26),
            const SizedBox(width: 16),
            Text(
              text,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Divider(
          thickness: 1.2,
          color: Colors.grey,
        ),
      ],
    );
  }
}
// ClipPath custom - sangat melengkung
class ExtraDeepClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 150);
    path.quadraticBezierTo(
      size.width / 2, size.height + 120,
      size.width, size.height - 150,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
