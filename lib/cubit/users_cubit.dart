import 'package:bloc/bloc.dart';
import 'package:bloc_api_project/models/users_model.dart';
import 'package:bloc_api_project/repo/users_repo.dart';
import 'package:equatable/equatable.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final UsersRepo usersRepo;
  UsersCubit(this.usersRepo) : super(UsersLoadingState());

  onLoadedUsers() async {
    try {
      emit(UsersLoadingState());
      var data = await usersRepo.getUsers();

      emit(UsersLoadedState(data));
    } catch (e) {
      emit(UsersErrorState(e.toString()));
    }
  }
}
