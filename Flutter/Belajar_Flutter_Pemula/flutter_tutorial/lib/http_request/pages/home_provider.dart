import 'package:flutter/material.dart';
import 'package:flutter_tutorial/http_request/models/http_provider.dart';
import 'package:provider/provider.dart';

class HomeProvider extends StatelessWidget {
  const HomeProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<HttpProvider>(context, listen: false);
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
              child: Consumer<HttpProvider>(
                builder: (context, value, child) => Text(
                  (value.data['id'] == '')
                      ? "ID : Belum ada data"
                      : "ID : ${value.data['id']}",
                  style: const TextStyle(fontSize: 20),
                ),
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
              child: Consumer<HttpProvider>(
                builder: (context, value, child) => Text(
                  (value.data['name'] == '')
                      ? "Belum ada data"
                      : "${value.data['name']}",
                  style: const TextStyle(fontSize: 20),
                ),
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
              child: Consumer<HttpProvider>(
                builder: (context, value, child) => Text(
                  (value.data['job'] == '')
                      ? "Belum ada data"
                      : "${value.data['job']}",
                  style: const TextStyle(fontSize: 20),
                ),
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
              child: Consumer<HttpProvider>(
                builder: (context, value, child) => Text(
                  (value.data['createdAt'] == '')
                      ? "Belum ada data"
                      : "${value.data['createdAt']}",
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            OutlinedButton(
                onPressed: () {
                  dataProvider.connectAPI("Diah Insani", "Web Developer");
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
