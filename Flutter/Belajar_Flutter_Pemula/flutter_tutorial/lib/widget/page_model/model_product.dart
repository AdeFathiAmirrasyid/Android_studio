import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/widget/models/product.dart';

class ModelProduct extends StatelessWidget {
  final faker = Faker();
  ModelProduct({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> dummyData = List.generate(100, (index) {
      return Product(
          faker.food.restaurant(),
          "https://picsum.photos/id/$index/200",
          10000 + Random().nextInt(2000000),
          faker.lorem.sentence());
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Marketplace"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemBuilder: (context, index) {
          return GridTile(
            footer: Container(
              color: Colors.grey[500],
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    dummyData[index].title,
                    maxLines: 1,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text("Rp ${dummyData[index].price}"),
                  Text(
                    dummyData[index].desc,
                    maxLines: 2,
                  )
                ],
              ),
            ),
            child: Image.network(dummyData[index].imageURL),
          );
        },
        itemCount: dummyData.length,
      ),
    );
  }
}
