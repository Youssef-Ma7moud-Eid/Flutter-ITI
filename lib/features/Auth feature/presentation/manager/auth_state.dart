abstract class AuthState {}

class InitialAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}

class SuccessAuthState extends AuthState {}

class FailureAuthState extends AuthState {
  final String message;

  FailureAuthState({required this.message});
}
