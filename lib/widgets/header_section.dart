import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header(this.data, {super.key});
  final Map data;

  @override
  Widget build(BuildContext context) {
    debugPrint(data.toString());
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            data['city'],
            style: const TextStyle(color: Colors.blue),
          ),
          const Image(
            image: AssetImage('assets/images/sun.png'),
            height: 100,
            width: 100,
          ),
          Text(
            data['weather']['main']['temp'].toString(),
            style: const TextStyle(color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
