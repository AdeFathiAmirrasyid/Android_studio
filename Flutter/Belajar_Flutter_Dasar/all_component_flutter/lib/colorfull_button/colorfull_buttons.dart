import 'dart:math';
import 'package:flutter/material.dart';

class ColorFullButtons extends StatefulWidget {
  late Color mainColor, secondColor;
  IconData iconData;

  @override
  State<ColorFullButtons> createState() =>
      _ColorFullButtonsState(mainColor, secondColor, iconData);
  ColorFullButtons(this.mainColor, this.secondColor, this.iconData);
}

class _ColorFullButtonsState extends State<ColorFullButtons> {
  bool isPressed = false;
  late Color mainColor, secondColor;
  IconData iconData;

  _ColorFullButtonsState(this.mainColor, this.secondColor, this.iconData);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(angle: pi / 4,
    child: GestureDetector(
      onTapDown: (details) {
        setState(() {
          isPressed = !isPressed;
        });
      },
      onTapUp: (details) {
        setState(() {
          isPressed = !isPressed;
        });
      },
      onTapCancel: () {
        setState(() {
          isPressed = !isPressed;
        });
      },
      child: Material(
        borderRadius: BorderRadius.circular(15),
        elevation: (isPressed) ? 5 : 10,
        shadowColor: (isPressed) ? secondColor : mainColor,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: Material(
                  borderRadius: BorderRadius.circular(15),
                  color: (isPressed) ? secondColor : mainColor,
                  child: Transform.rotate(angle: -pi / 4,
                  child: Icon(
                    iconData,
                    color: Colors.white,
                  ),)
                ),
              ),
              Transform.translate(
                offset: Offset(-30, 30),
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Material(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(-30, -30),
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Material(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(30, -30),
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Material(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(30, 30),
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Material(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),);
  }
}
