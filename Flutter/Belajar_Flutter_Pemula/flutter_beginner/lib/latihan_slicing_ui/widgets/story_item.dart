import 'package:flutter/material.dart';

class StoryItem extends StatelessWidget {
  String story;
  StoryItem({required this.story, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(80 / 2)),
                width: 60,
                height: 60,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 3),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            NetworkImage("https://picsum.photos/id/879/200/300")),
                    borderRadius: BorderRadius.circular(50)),
                width: 55,
                height: 55,
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(story)
        ],
      ),
    );
  }
}
