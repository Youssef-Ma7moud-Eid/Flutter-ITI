import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ListViewItem extends StatefulWidget {
  const ListViewItem({super.key, required this.index});
  final int index;

  @override
  State<ListViewItem> createState() => _ListViewItemState();
}

class _ListViewItemState extends State<ListViewItem> {
  IconData icon = Icons.favorite;
  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      duration: const Duration(milliseconds: 900),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  '${products[widget.index]['image']}',
                  height: 180,
                  width: 180,
                  fit: BoxFit.fill,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${products[widget.index]['title']}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 236, 227, 227),
                            child: IconButton(
                              onPressed: () {
                                icon = icon == Icons.favorite
                                    ? Icons.favorite_border
                                    : Icons.favorite;
                                setState(() {});
                              },
                              icon: Icon(
                                icon,
                                color: icon == Icons.favorite
                                    ? Colors.red
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${products[widget.index]['description']}',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 130,
              left: 210,
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(15),
                    height: 50,
                    color: Color(0XFFFAC334),
                    child: Text(
                      '${products[widget.index]['price']}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(15),
                    height: 50,
                    color: Color(0XFFFFDD57),
                    child: Text(
                      'Add to cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
