import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorial/bloc_provider/counter_bloc_provider.dart';

void main() {
  runApp(const MainBlocprovider());
}

class MainBlocprovider extends StatelessWidget {
  const MainBlocprovider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
          create: (context) => CounterCubit(),
          child: const HomePageBlocProvider()),
    );
  }
}

class HomePageBlocProvider extends StatelessWidget {
  const HomePageBlocProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter BloC Provider"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterCubit, int>(
              builder: (context, count) => Text("Angka saat ini : $count",
                  style: const TextStyle(fontSize: 25)),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () => context.read<CounterCubit>().decrement(),
                    icon: const Icon(Icons.remove)),
                IconButton(
                    onPressed: () => context.read<CounterCubit>().increment(),
                    icon: const Icon(Icons.add))
              ],
            )
          ],
        ),
      ),
    );
  }
}
