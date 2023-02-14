import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.red, Colors.amber]),
              borderRadius: BorderRadius.circular(105 / 2)),
          width: 105,
          height: 105,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 3),
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage("https://picsum.photos/id/879/200/300")),
              borderRadius: BorderRadius.circular(50)),
          width: 100,
          height: 100,
        ),
      ],
    );
  }
}
