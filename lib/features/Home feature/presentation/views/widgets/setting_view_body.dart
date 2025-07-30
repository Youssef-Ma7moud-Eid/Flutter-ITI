import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_flutter/core/utils/helper/snack_bar.dart';
import 'package:iti_flutter/features/Auth%20feature/presentation/manager/auth_cubit.dart';
import 'package:iti_flutter/features/Auth%20feature/presentation/manager/auth_state.dart';
import 'package:iti_flutter/features/Auth%20feature/presentation/views/sign_up_view.dart';
import 'package:iti_flutter/features/Home%20feature/presentation/manager/app_cubit.dart';

class SettingViewBody extends StatefulWidget {
  const SettingViewBody({super.key});

  @override
  State<SettingViewBody> createState() => _SettingViewBodyState();
}

class _SettingViewBodyState extends State<SettingViewBody> {
  String theme = 'Light Theme';

  late bool isDarkTheme;
  @override
  void initState() {
    var themee = AppCubit.get(context).getTheme();

    // ignore: unrelated_type_equality_checks
    if (themee == ThemeMode.dark) {
      isDarkTheme = true;
    } else {
      isDarkTheme = false;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LogoutSuccessState) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            title: 'Logout Success',
            desc: 'Go to SignIn again',

            btnOkOnPress: () {
              Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const SignUpView()),
                (route) => false,
              );
            },
          ).show();
        } else if (state is LogoutFauilreState) {
          scaffoldmessenger(
            color: Colors.red,
            text: state.message,
            context: context,
          );
        }
      },
      builder: (context, state) {
        if (state is LogoutLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
              strokeWidth: 6,
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FadeInRight(
                    duration: const Duration(milliseconds: 800),
                    child: Container(
                      height: 435,
                      width: 500,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/my_image.jpg',
                            width: 350,
                            height: 320,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 20),

                          Column(
                            children: const [
                              Text(
                                'Youssef Mahmoud Eid',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Flutter Developer',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  FadeInLeft(
                    duration: const Duration(milliseconds: 900),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            theme,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                          Switch(
                            value: isDarkTheme,
                            onChanged: (value) {
                              setState(() {
                                value = !isDarkTheme ? true : false;
                                theme = !isDarkTheme
                                    ? 'Dark Theme'
                                    : 'Light Theme';
                                isDarkTheme = value;
                                if (isDarkTheme) {
                                  AppCubit.get(
                                    context,
                                  ).selectTheme(ThemeModeState.dark);
                                } else {
                                  AppCubit.get(
                                    context,
                                  ).selectTheme(ThemeModeState.light);
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  FadeInRight(
                    duration: const Duration(milliseconds: 1300),
                    child: Container(
                      alignment: Alignment.center,
                      height: 70,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ListTile(
                        onTap: () async {
                          await AuthCubit.get(context).logout();
                        },
                        leading: const Icon(
                          Icons.logout,
                          color: Colors.red,
                          size: 30,
                        ),
                        title: const Text(
                          'Logout',
                          style: TextStyle(fontSize: 18, color: Colors.black87),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
