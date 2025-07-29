import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Sliver Demo'),
                centerTitle: true,
                background: CachedNetworkImage(
                  imageUrl: 'https://picsum.photos/800/400',
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      Image.asset('assets/images/logo.jpg', fit: BoxFit.fill),
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 30)),
            SliverToBoxAdapter(
              child: SizedBox(    // to handle unbounded height of list view
                height: 160,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(15),
                      height: 140,
                      width: 100,
                      color: Colors.blue,
                    );
                  },
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue[300],
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      'عنصر القائمة رقم ${index + 1}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text('تفاصيل إضافية عن العنصر هنا.'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('تم الضغط على العنصر رقم ${index + 1}'),
                        ),
                      );
                    },
                  ),
                ),
                childCount: 10,
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blue[300],
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'منتج رقم ${index + 1}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'السعر: ${(index + 1) * 10} ج.م',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 6),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('أضف إلى السلة'),
                      ),
                    ],
                  ),
                ),
                childCount: 20,
              ),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisExtent: 210,
                maxCrossAxisExtent: 200,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //   mainAxisExtent: 210,
              //   mainAxisSpacing: 12,
              //   crossAxisSpacing: 12,
              //   childAspectRatio: 0.75,
              //   crossAxisCount: 3,
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String title;
//   final bool centerTitle;
//   final List<Widget>? actions;
//   final Widget? leading;

//   const CustomAppBar({
//     super.key,
//     required this.title,
//     this.centerTitle = true,
//     this.actions,
//     this.leading,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: Text(title),
//       centerTitle: centerTitle,
//       actions: actions,
//       leading: leading,
//       backgroundColor: Colors.deepPurple,
//       elevation: 4,
//     );
//   }

//   @override
// Size get preferredSize => const Size.fromHeight(56.0);
// }
