import 'package:firebase_auth/firebase_auth.dart';
import 'package:iti_flutter/features/Auth%20feature/data/repo/repo.dart';

class AuthRepoImplement implements AuthRepo {
 

  @override
  Future<dynamic> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    String? errormessage;

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      print("Firebase Auth Error Code: ${e.code}");
      print("Firebase Auth Error Message: ${e.message}");

      errormessage =
          "Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} and code is ${e.code}";
      if (e.code == 'weak-password') {
        errormessage = 'الرقم السري ضعيف جداً.';
      } else if (e.code == 'email-already-in-use') {
        errormessage = 'لقد قمت بالتسجيل مسبقاً. الرجاء تسجيل الدخول.';
      } else if (e.code == 'network-request-failed') {
        // Check if it's actually a network issue or Firebase configuration issue
        errormessage =
            'مشكلة في الاتصال بخوادم Firebase. يرجى المحاولة مرة أخرى.';
      } else if (e.code == 'invalid-email') {
        errormessage = 'البريد الإلكتروني غير صحيح.';
      } else if (e.code == 'operation-not-allowed') {
        errormessage = 'إنشاء الحساب بالبريد الإلكتروني غير مفعل.';
      } else if (e.code == 'too-many-requests') {
        errormessage = 'تم تجاوز عدد المحاولات المسموح. يرجى الانتظار قليلاً.';
      } else {
        errormessage = 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.';
      }
    } catch (e) {
      print("General Error: $e");
      errormessage =
          "Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}";

      errormessage = 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.';
    }

    return errormessage;
  }

  @override
  Future<dynamic> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    String? errormessage;

    try {
      print("Attempting to sign in with email: $email");
      print("Firebase Auth instance: ${FirebaseAuth.instance}");

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      print("Sign in successful!");
    } on FirebaseAuthException catch (e) {
      print("Firebase Auth Error Code: ${e.code}");
      print("Firebase Auth Error Message: ${e.message}");
      print("Firebase Auth Error Details: ${e.toString()}");

      errormessage =
          "Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()} and code is ${e.code}";

      if (e.code == 'user-not-found') {
        errormessage = 'الرقم السري او البريد الالكتروني غير صحيح.';
      } else if (e.code == 'wrong-password') {
        errormessage = 'الرقم السري او البريد الالكتروني غير صحيح.';
      } else if (e.code == 'invalid-credential') {
        errormessage = 'الرقم السري او البريد الالكتروني غير صحيح.';
      } else if (e.code == 'network-request-failed') {
        // Check if it's actually a network issue or Firebase configuration issue
        errormessage =
            'مشكلة في الاتصال بخوادم Firebase. يرجى المحاولة مرة أخرى.';
      } else if (e.code == 'too-many-requests') {
        errormessage = 'تم تجاوز عدد المحاولات المسموح. يرجى الانتظار قليلاً.';
      } else if (e.code == 'operation-not-allowed') {
        errormessage = 'تسجيل الدخول بالبريد الإلكتروني غير مفعل.';
      } else if (e.code == 'user-disabled') {
        errormessage = 'تم تعطيل هذا الحساب.';
      } else {
        errormessage = 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.';
      }
    } catch (e) {
      print("General Error: $e");
      print("Error Type: ${e.runtimeType}");
      errormessage =
          "Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}";

      errormessage = 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.';
    }
    return errormessage;
  }

  @override
  Future<bool> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      print('User signed out successfully');
      return true;
    } catch (e) {
      print('Error signing out: $e');
      return false;
    }
  }
}
