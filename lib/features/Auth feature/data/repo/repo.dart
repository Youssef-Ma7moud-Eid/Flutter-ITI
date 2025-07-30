class AuthRepo {
  Future<dynamic> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {}
  Future<dynamic> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {}
  Future <void> deleteUser() async {}
   Future<void> logout() async {}
}
