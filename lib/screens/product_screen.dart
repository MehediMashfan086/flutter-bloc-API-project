import 'package:bloc_api_project/bloc/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    context.read<ProductsBloc>().add(ProductsLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Screen"),
        backgroundColor: Colors.blue,
      ),
      // body: BlocBuilder<ProductsBloc, ProductsState>(
      //   builder: (context, state) {
      //     if (state is ProductsLoadingState) {
      //       return const Center(
      //         child: CircularProgressIndicator.adaptive(),
      //       );
      //     } else if (state is ProductsLoadedState) {
      //       return ListView.builder(
      //         itemCount: state.productsModel.length,
      //         itemBuilder: (context, index) {
      //           return ListTile(
      //             leading: Text(state.productsModel[index].category.toString()),
      //           );
      //         },
      //       );
      //     } else if (state is ProductsErrorState) {
      //       return Center(
      //         child: Text(state.errorMessage),
      //       );
      //     }
      //     return const SizedBox();
      //   },
      // ),

      // body: BlocListener<ProductsBloc, ProductsState>(
      //   listener: (context, state) {
      //     if (state is ProductsLoadedState) {
      //       VxToast.show(context,
      //           msg: "Velocity x Products Loaded",
      //           position: VxToastPosition.top);
      //       ScaffoldMessenger.of(context)
      //           .showSnackBar(const SnackBar(content: Text("Data Loaded")));
      //     } else if (state is ProductsErrorState) {
      //       VxToast.show(context,
      //           msg: "Velocity x Products Not Loaded",
      //           position: VxToastPosition.top);
      //       ScaffoldMessenger.of(context)
      //           .showSnackBar(const SnackBar(content: Text("Data Not Loaded")));
      //     }
      //   },
      //   child: const Center(
      //     child: Text(
      //       "Bloc Listener",
      //       style: TextStyle(fontSize: 22),
      //     ),
      //   ),
      // ),

      body: BlocConsumer<ProductsBloc, ProductsState>(
        listener: (context, state) {
          if (state is ProductsLoadedState) {
            VxToast.show(context,
                msg: "Velocity x Products Loaded",
                position: VxToastPosition.top);
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Data Loaded")));
          } else if (state is ProductsErrorState) {
            VxToast.show(context,
                msg: "Velocity x Products Not Loaded",
                position: VxToastPosition.top);
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Data Not Loaded")));
          }
        },
        builder: (context, state) {
          if (state is ProductsLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is ProductsLoadedState) {
            return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 8,
              ),
              itemCount: state.productsModel.length,
              itemBuilder: (context, index) {
                var data = state.productsModel[index];
                return Card(
                  child: Column(
                    children: [
                      Text(
                        data.id.toString(),
                        style:
                            const TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                      Text(
                        data.title.toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        data.price.toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        data.description.toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        data.category.toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        data.image.toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        data.rating!.rate.toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        data.rating!.count.toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (state is ProductsErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
