abstract class AuthState {}

class InitialAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}

class SuccessAuthState extends AuthState {}

class LogoutSuccessState extends AuthState {}

class LogoutLoadingState extends AuthState {}

class LogoutFauilreState extends AuthState {
  final String message;

  LogoutFauilreState({required this.message});
}

class FailureAuthState extends AuthState {
  final String message;

  FailureAuthState({required this.message});
}
