import 'package:flutter/material.dart';
import 'package:iti_flutter/features/Auth%20feature/presentation/views/splash_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashView());
  }
}
