import 'package:flutter/material.dart';

class HeroCliprrectWidget extends StatelessWidget {
  const HeroCliprrectWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MaterialApp(
        home: MainHero(),
      ),
    );
  }
}

class MainHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue[50],
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "Latihan Hero Animation",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SecondHero();
              }));
            },
            child: Hero(
              tag: 'pp',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  width: 100,
                  height: 100,
                  child: const Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://assets.promediateknologi.com/crop/0x0:0x0/750x500/photo/2022/08/02/1281459792.jpg"),
                  ),
                ),
              ),
            )));
  }
}

class SecondHero extends StatelessWidget {
  const SecondHero({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[50],
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "Latihan Hero Animation",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
            child: Hero(
          tag: "pp",
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
              width: 200,
              height: 200,
              child: const Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://assets.promediateknologi.com/crop/0x0:0x0/750x500/photo/2022/08/02/1281459792.jpg"),
              ),
            ),
          ),
        )));
  }
}
