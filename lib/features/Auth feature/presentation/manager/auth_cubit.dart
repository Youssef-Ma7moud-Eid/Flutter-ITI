import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_flutter/features/Auth%20feature/data/repo/repo.dart';
import 'package:iti_flutter/features/Auth%20feature/presentation/manager/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(InitialAuthState());

  final AuthRepo authRepo;

  static AuthCubit get(context) => BlocProvider.of(context);

  Future<void> checkSignin(String emal, String pass) async {
    dynamic message = await authRepo.createUserWithEmailAndPassword(
      email: emal,
      password: pass,
    );
    emit(LoadingAuthState());
    await Future.delayed(Duration(milliseconds: 1500));
    if (message == null) {
      emit(SuccessAuthState());
    } else {
      emit(FailureAuthState(message: message));
    }
  }

  Future<void> checkLogin(String emal, String pass) async {
    dynamic message = await authRepo.signInWithEmailAndPassword(
      email: emal,
      password: pass,
    );
    emit(LoadingAuthState());
    await Future.delayed(Duration(milliseconds: 1500));
    if (message == null) {
      emit(SuccessAuthState());
    } else {
      emit(FailureAuthState(message: message));
    }
  }

  Future<void> deleteccount() async {
    await authRepo.deleteUser();
  }
   Future<void> logout() async {
    await authRepo.logout();
  }
}
