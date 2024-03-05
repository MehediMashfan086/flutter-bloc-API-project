import 'package:bloc_api_project/cubit/users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  void initState() {
    context.read<UsersCubit>().onLoadedUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Users Screen",
          ),
          backgroundColor: Colors.indigo,
        ),
        body: BlocConsumer<UsersCubit, UsersState>(
          listener: (context, state) {
            if (state is UsersLoadedState) {
              VxToast.show(context,
                  msg: "Velocity x Users Loaded",
                  position: VxToastPosition.top);
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Data Loaded")));
            } else if (state is UsersErrorState) {
              VxToast.show(context,
                  msg: "Velocity x Users Not Loaded",
                  position: VxToastPosition.top);
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Data Not Loaded")));
            }
          },
          builder: (context, state) {
            return BlocBuilder<UsersCubit, UsersState>(
              builder: (context, state) {
                if (state is UsersLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (state is UsersLoadedState) {
                  return ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 8,
                    ),
                    itemCount: state.usersModel.length,
                    itemBuilder: (context, index) {
                      var data = state.usersModel[index];
                      return Card(
                        child: Column(
                          children: [
                            Text(
                              data.id.toString(),
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.indigo),
                            ),
                            Text(
                              data.name.toString(),
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              data.username.toString(),
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              data.email.toString(),
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              data.address!.street.toString(),
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              data.address!.suite.toString(),
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              data.address!.city.toString(),
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              data.address!.zipcode.toString(),
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              data.address!.geo!.lat.toString(),
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              data.address!.geo!.lng.toString(),
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              data.phone.toString(),
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              data.website.toString(),
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              data.company!.name.toString(),
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              data.company!.catchPhrase.toString(),
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              data.company!.bs.toString(),
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else if (state is UsersErrorState) {
                  return Center(
                    child: Text(state.errorMessage),
                  );
                }
                return const SizedBox();
              },
            );
          },
        ));
  }
}
