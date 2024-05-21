import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        children: [
          Text(
            style: TextStyle(color: Colors.blue),
            'salut',
          ),
          Image(
            image: AssetImage('sun.png'),
          )
        ],
      ),
    );
  }
}
