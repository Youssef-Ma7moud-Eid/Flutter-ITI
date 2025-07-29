import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iti_flutter/features/Home%20feature/presentation/views/widgets/card_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return FadeInRight(
            duration: const Duration(milliseconds: 900),
            delay: Duration(milliseconds: index * 190),
            child: CardItem(index: index),
          );
        },
      ),
    );
  }
}

List<Map<String, String>> meals = [
  {'image': 'assets/images/meal1.jpg', 'name': 'Grilled Chicken'},
  {'image': 'assets/images/meal2.jpg', 'name': 'Pasta Carbonara'},
  {'image': 'assets/images/meal3.png', 'name': 'Avocado Toast'},
  {'image': 'assets/images/meal4.jpg', 'name': 'Beef Burger'},
  {'image': 'assets/images/meal5.jpg', 'name': 'Sushi Combo'},
  {'image': 'assets/images/meal6.jpg', 'name': 'Vegan Bowl'},
  {'image': 'assets/images/meal7.jpg', 'name': 'Shawarma Wrap'},
  {'image': 'assets/images/meal8.jpg', 'name': 'Seafood Pasta'},
  {'image': 'assets/images/meal9.jpg', 'name': 'Fried Rice'},
  {'image': 'assets/images/meal10.jpg', 'name': 'Cheese Pizza'},
  {'image': 'assets/images/meal11.jpg', 'name': 'Chicken Curry'},
  {'image': 'assets/images/meal12.jpg', 'name': 'Salmon Plate'},
  {'image': 'assets/images/meal13.jpg', 'name': 'Chocolate Cake'},
];
