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
          return CardItem(index: index);
        },
      ),
    );
  }
}


List<Map<String, String>> meals = [
  {'image': 'assets/meal1.jpg', 'name': 'Grilled Chicken'},
  {'image': 'assets/meal2.jpg', 'name': 'Pasta Carbonara'},
  {'image': 'assets/meal3.png', 'name': 'Avocado Toast'},
  {'image': 'assets/meal4.jpg', 'name': 'Beef Burger'},
  {'image': 'assets/meal5.jpg', 'name': 'Sushi Combo'},
  {'image': 'assets/meal6.jpg', 'name': 'Vegan Bowl'},
  {'image': 'assets/meal7.jpg', 'name': 'Shawarma Wrap'},
  {'image': 'assets/meal8.jpg', 'name': 'Seafood Pasta'},
  {'image': 'assets/meal9.jpg', 'name': 'Fried Rice'},
  {'image': 'assets/meal10.jpg', 'name': 'Cheese Pizza'},
  {'image': 'assets/meal11.jpg', 'name': 'Chicken Curry'},
  {'image': 'assets/meal12.jpg', 'name': 'Salmon Plate'},
  {'image': 'assets/meal13.jpg', 'name': 'Chocolate Cake'},
];
