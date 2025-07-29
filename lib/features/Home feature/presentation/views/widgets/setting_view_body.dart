import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
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
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          FadeInRight(
            duration: const Duration(milliseconds: 800),
            child: Container(
              height: 500,
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
                    width: 400,
                    height: 350,
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
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 30),

          FadeInLeft(
            duration: const Duration(milliseconds: 900),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                  ),
                  Switch(
                    value: isDarkTheme,
                    onChanged: (value) {
                      setState(() {
                        value = !isDarkTheme ? true : false;
                        theme = !isDarkTheme ? 'Dark Theme' : 'Light Theme';
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
        ],
      ),
    );
  }
}
