import 'package:all_component_flutter/request_api/post_result.dart';
import 'package:all_component_flutter/request_api/user_model.dart';
import 'package:flutter/material.dart';

class RequestApi extends StatefulWidget {
  const RequestApi({Key? key}) : super(key: key);

  @override
  State<RequestApi> createState() => _RequestApiState();
}

class _RequestApiState extends State<RequestApi> {
  PostResult? postResult;
  User? user;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Request API"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text((postResult != null)
                  ? "${postResult?.id} | ${postResult?.name} | ${postResult?.job} | ${postResult?.created}"
                  : "Tidak Ada Data"),
              ElevatedButton(
                  onPressed: () {
                    PostResult.connectToAPI("Fathi Insani", "Mobile Developer")
                        .then((value) {
                      postResult = value;
                      setState(() {});
                    });
                  },
                  child: Text("Post Result")),
              Text((user != null)
                  ? "${user?.id} | ${user?.name}"
                  : "Tidak Ada Data"),
              ElevatedButton(
                  onPressed: () {
                    User.connectToAPI("5").then((valueUser) {
                      user = valueUser;
                      setState(() {});
                    });
                  },
                  child: Text("Post User")),
            ],
          ),
        ),
      ),
    );
  }
}
