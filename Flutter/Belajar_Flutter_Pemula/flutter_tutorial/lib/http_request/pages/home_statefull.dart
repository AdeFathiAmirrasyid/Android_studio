import 'package:flutter/material.dart';

import '../models/http_statefull.dart';

class HomeStateFull extends StatefulWidget {
  const HomeStateFull({Key? key}) : super(key: key);

  @override
  State<HomeStateFull> createState() => _HomeStateFullState();
}

class _HomeStateFullState extends State<HomeStateFull> {
  HttpStateFull dataResponse = HttpStateFull();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("POST - STATEFULL"),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              child: Text(
                (dataResponse.id == '')
                    ? "ID : Belum ada data"
                    : "ID : ${dataResponse.id}",
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const FittedBox(
              child: Text(
                "Name : ",
                style: TextStyle(fontSize: 20),
              ),
            ),
            FittedBox(
              child: Text(
                (dataResponse.name == '')
                    ? "ID : Belum ada data"
                    : "ID : ${dataResponse.name}",
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const FittedBox(
              child: Text(
                "Job : ",
                style: TextStyle(fontSize: 20),
              ),
            ),
            FittedBox(
              child: Text(
                (dataResponse.job == '')
                    ? "ID : Belum ada data"
                    : "ID : ${dataResponse.job}",
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const FittedBox(
              child: Text(
                "Created At : ",
                style: TextStyle(fontSize: 20),
              ),
            ),
            FittedBox(
              child: Text(
                (dataResponse.createdAt == '')
                    ? "ID : Belum ada data"
                    : "ID : ${dataResponse.createdAt}",
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            OutlinedButton(
                onPressed: () {
                  HttpStateFull.connectAPI("Insani", 'marketing').then((value) {
                    setState(() {
                      dataResponse = value;
                    });
                  });
                },
                child: const Text(
                  "POST DATA",
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
