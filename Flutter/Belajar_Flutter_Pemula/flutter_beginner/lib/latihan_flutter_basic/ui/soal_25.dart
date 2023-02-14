import 'package:flutter/material.dart';

class SoalDuaPuluhLima extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
          height: 70,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              if (index % 2 == 0) {
                return Container(
                  width: 70,
                  height: 70,
                  color: Colors.amber,
                  margin: const EdgeInsets.only(right: 20),
                );
              }

              return Container(
                width: 70,
                height: 70,
                color: Colors.blue,
                margin: const EdgeInsets.only(right: 20),
              );
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) {
              if (index % 2 == 0) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150,
                      color: Colors.amber,
                      margin: const EdgeInsets.only(bottom: 20),
                    ),
                    Text(
                      "Hello ${index + 1}",
                      style: const TextStyle(fontSize: 24),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    color: Colors.blue,
                    margin: const EdgeInsets.only(bottom: 20),
                  ),
                  Text(
                    "Hello ${index + 1}",
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
