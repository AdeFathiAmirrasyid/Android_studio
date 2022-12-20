import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CarouselWithIndicatorDemo(),
      // home: HomePage(),
    );
  }
}

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<Widget> myData = [
    Container(
      color: Colors.amber,
      height: 200,
      width: 200,
      child: const Center(child:  Text("Text 1")),
    ),
    Container(
      color: Colors.red,
      height: 200,
      width: 200,
      child: const Center(child:  Text("Text 2")),
    ),
    Container(
      color: Colors.blueAccent,
      height: 200,
      width: 200,
      child: const Center(child:  Text("Text 3")),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Carousel with indicator controller demo')),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        CarouselSlider(
          items: myData,
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: myData.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Carousel Slider"),
//       ),
//       body: CarouselSlider(
//         options: CarouselOptions(
//             height: 400.0,
//           autoPlay: true,
//           autoPlayInterval: const Duration(seconds: 2),
//           viewportFraction: 1
//         ),
//         items: [1, 2, 3, 4, 5].map((i) {
//           return Builder(builder: (BuildContext context) {
//             return Container(
//               width: MediaQuery.of(context).size.width,
//               margin: const EdgeInsets.symmetric(horizontal: 5.0),
//               decoration: const BoxDecoration(color: Colors.amber),
//               child: Center(
//                 child: Text(
//                   'text $i',
//                   style: const TextStyle(fontSize: 16),
//                 ),
//               ),
//             );
//           });
//         }).toList(),
//       ),
//     );
//   }
// }
