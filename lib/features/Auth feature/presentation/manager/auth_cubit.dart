import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_flutter/core/cache/cache_helper.dart';
import 'package:iti_flutter/features/Auth%20feature/data/repo/repo.dart';
import 'package:iti_flutter/features/Auth%20feature/presentation/manager/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(InitialAuthState());

  final AuthRepo authRepo;

  static AuthCubit get(context) => BlocProvider.of(context);

  Future<void> checkSignin(String emal, String pass) async {
    emit(LoadingAuthState());
    dynamic message = await authRepo.createUserWithEmailAndPassword(
      email: emal,
      password: pass,
    );

    if (message == null) {
      await CacheHelper().saveData(key: 'NewUser', value: true);
      emit(SuccessAuthState());
    } else {
      emit(FailureAuthState(message: message));
    }
  }

  Future<void> checkLogin(String emal, String pass) async {
    emit(LoadingAuthState());
    dynamic message = await authRepo.signInWithEmailAndPassword(
      email: emal,
      password: pass,
    );

    if (message == null) {
      await CacheHelper().saveData(key: 'NewUser', value: true);
      emit(SuccessAuthState());
    } else {
      emit(FailureAuthState(message: message));
    }
  }

  Future<void> deleteccount() async {
    emit(DeleteAccountLoadingState());
    dynamic check = await authRepo.deleteUser();
    if (check == true) {
      await CacheHelper().removeData(key: 'NewUser');
      emit(DeleteAccountSuccessState());
    } else {
      emit(DeleteAccountFauilreState(message: 'Error in delete  Account'));
    }
  }

  Future<void> logout() async {
    emit(LogoutLoadingState());
    dynamic check = await authRepo.logout();
    if (check == true) {
      await CacheHelper().removeData(key: 'NewUser');
      emit(LogoutSuccessState());
    } else {
      emit(LogoutFauilreState(message: 'Error in Logout from Account'));
    }
  }

 
}
