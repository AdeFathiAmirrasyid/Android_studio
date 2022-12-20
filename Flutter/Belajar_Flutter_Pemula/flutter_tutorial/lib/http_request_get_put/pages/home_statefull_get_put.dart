import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tutorial/http_request_get_put/models/http_statefull_get_put.dart';

class HomeStateFullGetPut extends StatefulWidget {
  const HomeStateFullGetPut({Key? key}) : super(key: key);

  @override
  State<HomeStateFullGetPut> createState() => _HomeStateFullStateGetPut();
}

class _HomeStateFullStateGetPut extends State<HomeStateFullGetPut> {
  HttpStateFullGetPut dataResponse =
      HttpStateFullGetPut(id: '', fullName: '', email: '', avatar: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GET - STATEFULL"),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                height: 100,
                width: 100,
                child: Image.network(
                  (dataResponse.avatar == '')
                      ? "https://www.uclg-planning.org/sites/default/files/styles/featured_home_left/public/no-user-image-square.jpg?itok=PANMBJF-"
                      : dataResponse.avatar,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FittedBox(
              child: Text(
                (dataResponse.id == '')
                    ? "ID : Belum ada data"
                    : "ID : ${dataResponse.id}",
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const FittedBox(
              child: Text(
                "Name : ",
                style: TextStyle(fontSize: 20),
              ),
            ),
            FittedBox(
              child: Text(
                (dataResponse.fullName == '')
                    ? "Belum ada data"
                    : dataResponse.fullName,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const FittedBox(
              child: Text(
                "Email : ",
                style: TextStyle(fontSize: 20),
              ),
            ),
            FittedBox(
              child: Text(
                (dataResponse.email == '')
                    ? "Belum ada data"
                    : dataResponse.email,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            OutlinedButton(
                onPressed: () {
                  HttpStateFullGetPut.connectAPI(
                          (1 + Random().nextInt(10)).toString())
                      .then((value) {
                    setState(() {
                      dataResponse = value;
                    });
                  });
                },
                child: const Text(
                  "GET DATA",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
