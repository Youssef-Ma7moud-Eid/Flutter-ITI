import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_flutter/core/cache/cache_helper.dart';
import 'package:iti_flutter/core/theme/dark_mode.dart';
import 'package:iti_flutter/core/theme/light_mode.dart';
import 'package:iti_flutter/features/Auth%20feature/data/repo/repo_implement.dart';
import 'package:iti_flutter/features/Auth%20feature/presentation/manager/auth_cubit.dart';
import 'package:iti_flutter/features/Auth%20feature/presentation/views/splash_view.dart';
import 'package:iti_flutter/features/Home%20feature/presentation/manager/app_cubit.dart';
import 'package:iti_flutter/features/Home%20feature/presentation/manager/app_state.dart';
import 'package:iti_flutter/features/Home%20feature/presentation/views/main_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),
        BlocProvider(create: (context) => AuthCubit(AuthRepoImplement())),
      ],
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return MaterialApp(
            theme: lightTheme,
            darkTheme: darkTheme,
            themeAnimationCurve: Curves.fastOutSlowIn,
            themeAnimationDuration: const Duration(milliseconds: 1500),
            themeMode: AppCubit.get(context).getTheme(),
            debugShowCheckedModeBanner: false,
            home: CacheHelper().getData(key: 'NewUser') != null
                ? MainView()
                : SplashView(),
          );
        },
      ),
    );
  }
}
