import 'package:flutter/cupertino.dart';
import 'package:iti_flutter/features/Home%20feature/presentation/views/home_view.dart';
import 'package:iti_flutter/features/Home%20feature/presentation/views/setting_view.dart';
import 'package:iti_flutter/features/Home%20feature/presentation/views/shopping_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainViewBody extends StatefulWidget {
  const MainViewBody({super.key});

  @override
  State<MainViewBody> createState() => _MainViewBodyState();
}

class _MainViewBodyState extends State<MainViewBody> {
  late PersistentTabController controller;

  @override
  void initState() {
    super.initState();
    controller = PersistentTabController(initialIndex: 0);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller,
      screens: screens(),
      items: items(),
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 300),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
    );
  }
}

List<Widget> screens() {
  return [HomeView(), ShoppingView(), SettingsView()];
}

List<PersistentBottomNavBarItem> items() {
  return [
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.home),
      title: 'Home',
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
      textStyle: TextStyle(fontWeight: FontWeight.w400),
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      title: 'Shopping',
      textStyle: TextStyle(fontWeight: FontWeight.w400),
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.settings),
      title: 'Setting',
      textStyle: TextStyle(fontWeight: FontWeight.w400),
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
  ];
}
