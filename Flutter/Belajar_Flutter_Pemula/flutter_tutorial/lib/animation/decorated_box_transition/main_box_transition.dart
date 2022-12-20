import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 300))
    ..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final DecorationTween decorationTween = DecorationTween(
      begin: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(0)),
      end: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(100)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Decorated Box Transition"),
      ),
      body: Center(
          child: DecoratedBoxTransition(
        decoration: decorationTween.animate(_controller),
        child: Container(
          width: 200,
          height: 200,
          padding: const EdgeInsets.all(50),
          child: const FlutterLogo(),
        ),
      )),
    );
  }
}
