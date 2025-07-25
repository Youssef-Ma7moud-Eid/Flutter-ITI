import 'package:flutter/material.dart';

class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('${list[index]['image']}', width: 50, height: 50),
        SizedBox(height: 10),
        Text('${list[index]['name']}'),
      ],
    );
  }
}

List<Map<String, String>> list = [
  {'image': 'assets/images/sofas.png', 'name': 'sofas'},
  {'image': 'assets/images/wardrobe.png', 'name': 'wardrobe'},
  {'image': 'assets/images/disk.png', 'name': 'disk'},
  {'image': 'assets/images/dresser.png', 'name': 'dresser'},
];
