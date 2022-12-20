import 'package:flutter/material.dart';

class GradientOpacity extends StatelessWidget {
  const GradientOpacity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Gradient Opacity"),
        ),
        body: Center(
          child: ShaderMask(
            shaderCallback: (rectangle){
              return const LinearGradient(colors: [Colors.black, Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter).createShader(Rect.fromLTRB(0, 0, rectangle.width, rectangle.width));
            },
            blendMode: BlendMode.dstIn,
            child: const Image(
              width: 300,
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1595327656903-2f54e37ce09b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80"),
              fit: BoxFit.cover,
            ),
          )
        ),
      ),
    );
  }
}
