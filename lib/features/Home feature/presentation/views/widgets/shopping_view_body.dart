import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iti_flutter/features/Home%20feature/presentation/views/widgets/custom_category_item.dart';
import 'package:iti_flutter/features/Home%20feature/presentation/views/widgets/custom_text_field.dart';
import 'package:iti_flutter/features/Home%20feature/presentation/views/widgets/list_view_item.dart';

class ShoppingViewBody extends StatelessWidget {
  const ShoppingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: FadeInLeft(
                     duration: const Duration(milliseconds: 900),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.white, width: 2),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/my_image.jpg'),
                            fit: BoxFit.fill,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 2,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 50),

              FadeInRight(
                   duration: const Duration(milliseconds: 900),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'Hello ,Youssef',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 31,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              FadeInLeft(
                   duration: const Duration(milliseconds: 900),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'What do you want to buy?',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const CustomTextField(),
              ),
              const SizedBox(height: 20),

              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: 140,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        child: ListView.builder(
                          padding: const EdgeInsets.only(top: 30),
                          itemCount: list.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: CustomCategoryItem(index: index),
                            );
                          },
                        ),
                      ),
                    ),
                    const Divider(),

                    SizedBox(height: 300, child: CustomListView()),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomListView extends StatelessWidget {
  const CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      physics: BouncingScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: ListViewItem(index: index),
        );
      },
    );
  }
}

List<String> list = ['Sofas', 'Chairs', 'Lamps', 'Tables'];

/// Dummy products list
List<Map<String, String>> products = [
  {
    'title': 'FinnNacian',
    'price': r'$248',
    'image': 'assets/images/ottoman.png',
    'description':
        'Scandinavian small sized double ottoman imported full leather / Dale Italia oil wax leather black',
  },
  {
    'title': 'FinnNacian',
    'price': r'$298',
    'image': 'assets/images/chair.png',
    'description':
        'Scandinavian small sized double chair imported full leather / Dale Italia oil wax leather black',
  },
  {
    'title': 'FinnNaciantit',
    'price': r'$3000',
    'image': 'assets/images/ottoman.png',
    'description':
        'Scandinavian small sized double ottoman imported full leather / Dale Italia oil wax leather black',
  },
];
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}