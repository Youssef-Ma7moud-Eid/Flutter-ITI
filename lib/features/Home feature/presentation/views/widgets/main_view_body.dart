import 'package:flutter/cupertino.dart';
import 'package:iti_flutter/features/Home%20feature/presentation/views/home_view.dart';
import 'package:iti_flutter/features/Home%20feature/presentation/views/setting_view.dart';
import 'package:iti_flutter/features/Home%20feature/presentation/views/shopping_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;

    controller = PersistentTabController(initialIndex: 0);
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
