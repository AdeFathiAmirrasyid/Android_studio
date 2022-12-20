import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Latihan Image"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(top: 70),
                  color: Colors.black,
                  width: 200,
                  height: 200,
                  padding: EdgeInsets.all(3),
                  child: Image(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1661961110218-35af7210f803?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80'),
                    fit: BoxFit.contain,
                    repeat: ImageRepeat.repeat,
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  color: Colors.black,
                  width: 200,
                  height: 200,
                  padding: EdgeInsets.all(3),
                  child: Image(
                    image: AssetImage('images/marko.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
