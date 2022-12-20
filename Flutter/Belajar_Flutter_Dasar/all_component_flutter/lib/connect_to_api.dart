import 'package:all_component_flutter/request_api/user_model_api.dart';
import 'package:flutter/material.dart';

class connectToApi extends StatefulWidget {
  const connectToApi({Key? key}) : super(key: key);

  @override
  State<connectToApi> createState() => _connectToApiState();
}

class _connectToApiState extends State<connectToApi> {
  late String output = "No Data";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Api Demo"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(output),
              ElevatedButton(
                  onPressed: () {
                    User.getUsers("1").then((users) {
                      output = "";
                      for (int i = 0; i < users.length; i++) {
                        output = "$output[ ${users[i].name} ]";
                        setState(() {});
                      }
                    });
                  },
                  child: const Text("GET"))
            ],
          ),
        ),
      ),
    );
  }
}
