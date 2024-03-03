import 'package:bloc_api_project/bloc/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocListenerScreen extends StatefulWidget {
  const BlocListenerScreen({super.key});

  @override
  State<BlocListenerScreen> createState() => _BlocListenerScreenState();
}

class _BlocListenerScreenState extends State<BlocListenerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BlocListener"),
        backgroundColor: Colors.deepOrange,
      ),
      body: BlocListener<ProductsBloc, ProductsState>(
        listener: (context, state) {
          if (state is ProductsLoadedState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Data Loaded")));
          }
        },
        child: const Center(
            child: Text(
          "Bloc Listener",
          style: TextStyle(fontSize: 22),
        )),
      ),
    );
  }
}
