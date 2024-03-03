import 'package:bloc_api_project/screens/bloc_listener_screen.dart';
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
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            TextButton(
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
            const SizedBox(
              height: 4,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const BlocListenerScreen();
                    },
                  ),
                );
              },
              child: const Text(
                "Get Bloc Listener",
                style: TextStyle(fontSize: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
