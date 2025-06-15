//Lodhi Sarma - 1462200162
import 'package:flutter/material.dart';
import 'package:project1/day1.dart';
import 'package:intl/intl.dart';
class HariPage extends StatelessWidget {
  const HariPage({super.key});
  String getCurrentTime() {
    final now = DateTime.now();
    final formatter = DateFormat('hh a');
    return formatter.format(now);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.asset("assets/img/img.jpeg"),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1,
                children: [
                  buildDayButton(context, "DAY 1", const Day1()),
                  buildDayButton(context, "DAY 2", const Day1()),
                  buildDayButton(context, "DAY 3", const Day1()),
                  buildDayButton(context, "DAY 4", const Day1()),
                  buildDayButton(context, "DAY 5", const Day1()),
                  buildDayButton(context, "DAY 6", const Day1()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget buildDayButton(BuildContext context, String label, Widget page) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.lightBlue.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            getCurrentTime(),
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
