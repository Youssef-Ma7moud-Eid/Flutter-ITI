import 'package:flutter/material.dart';
import 'package:iti_flutter/features/Auth%20feature/presentation/views/sign_up_view.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          right: -50,
          child: CustomPaint(
            size: const Size(200, 200),
            painter: TopRightShapePainter(),
          ),
        ),
        Positioned(
          top: 250,
          left: -5,
          child: Container(
            width: 100,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.blue.shade300,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
          ),
        ),
        Positioned(
          top: 150,
          right: 0,
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.pink.shade300,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(100),
                bottomLeft: Radius.circular(100),
              ),
            ),
          ),
        ),

        // Main Content
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Spacer(),
                const SizedBox(height: 260),
                Image.asset('assets/images/logo.jpg', height: 300),
                const SizedBox(height: 50),
                const Text(
                  'دَعْمٌ وتمكينٌ لمستقبلٍ أفضل لفئاتنا الخاصة',
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => SignUpView()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 150,
                      vertical: 12,
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignUpView()),
                      );
                    },
                    child: Text(
                      'دعنا نبدأ',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TopRightShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.yellow.shade100;

    final path = Path();
    path.lineTo(size.width * 0.5, 0);
    path.quadraticBezierTo(
      size.width,
      size.height * 0.2,
      size.width * 0.8,
      size.height,
    );
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
