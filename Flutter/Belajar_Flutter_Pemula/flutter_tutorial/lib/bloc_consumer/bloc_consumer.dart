import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const BlocConsumerApp());
}

class BlocConsumerApp extends StatelessWidget {
  const BlocConsumerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => CounterBlocConsumer(),
        child: const HomePageBlocConsumer(),
      ),
    );
  }
}

class HomePageBlocConsumer extends StatelessWidget {
  const HomePageBlocConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Consumer"),
      ),
      body: Center(
        child: BlocConsumer<CounterBlocConsumer, int>(
          buildWhen: (previous, current) {
            print("Pre : $previous ---- Cur $current");
            if(current > 5){
              return true;
            }
            return false;
          },
          listenWhen: (previous, current) {
            print("Pre : $previous ---- Cur $current");
            if(current > 5){
              return true;
            }
            return false;
      },
          listener: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Di Atas 10"),
                duration: Duration(milliseconds: 300),
              ));
          },
          builder: (context, state) => Text(
            "Angka $state",
            style: const TextStyle(fontSize: 35),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CounterBlocConsumer>().increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CounterBlocConsumer extends Cubit<int> {
  CounterBlocConsumer() : super(0);

  void increment() => emit(state + 1);
}
