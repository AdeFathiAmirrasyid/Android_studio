import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clip"),
      ),
      body: Center(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Container(
                width: 200,
                height: 100,
                color: Colors.blue,
              ),
            ),
            ClipOval(
              child: Container(
                width: 200,
                height: 100,
                color: Colors.blue,
              ),
            ),
            ClipRect(
                child: Align(
              alignment: Alignment.topRight,
              heightFactor: 0.75,
              widthFactor: 0.5,
              child: Container(
                  color: Colors.amber,
                  child: const FlutterLogo(
                    size: 200,
                  )),
            )),
            const SizedBox(
              height: 10,
            ),
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.grey,
                  child: const FlutterLogo(
                    size: 200,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var controlPoint1 = Offset(50, size.height - 100);
    var controlPoint2 = Offset(size.width - 50, size.height);
    var endPoint = Offset(size.width, size.height - 50);
    
    Path path = Path()
      ..moveTo(size.width/2, 0) // potong dari 0.0 -> 0.200
      ..lineTo(0, size.height - 50)
      ..cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx, controlPoint2.dy, endPoint.dx, endPoint.dy)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
