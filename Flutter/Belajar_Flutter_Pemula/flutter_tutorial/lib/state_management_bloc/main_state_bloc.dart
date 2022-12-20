import 'package:flutter/material.dart';
import 'package:flutter_tutorial/state_management_bloc/blocs/counter.dart';

void main() {
  runApp(const StateManagementApp());
}

class StateManagementApp extends StatelessWidget {
  const StateManagementApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePageStateBloc(),
    );
  }
}

class HomePageStateBloc extends StatefulWidget {
  HomePageStateBloc({Key? key}) : super(key: key);

  @override
  State<HomePageStateBloc> createState() => _HomePageStateBlocState();
}

class _HomePageStateBlocState extends State<HomePageStateBloc> {
  CounterBloc counterBloc = CounterBloc();
  @override
  void dispose() {
    counterBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter BloC"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
                stream: counterBloc.output,
                initialData: 0,
                builder: (context, snapshot) => Text(
                    "Angka saat ini : ${snapshot.data}",
                    style: TextStyle(fontSize: 25))),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      counterBloc.inputan.add('minus');
                    },
                    icon: const Icon(Icons.remove)),
                IconButton(
                    onPressed: () {
                      counterBloc.inputan.add('add');
                    },
                    icon: const Icon(Icons.add))
              ],
            )
          ],
        ),
      ),
    );
  }
}
