import 'package:bloc_api_project/screens/product_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const ProductScreen();
                },
              ),
            );
          },
          child: const Text(
            "Get Products",
            style: TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }
}
