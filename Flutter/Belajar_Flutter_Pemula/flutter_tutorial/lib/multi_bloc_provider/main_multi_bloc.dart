import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorial/multi_bloc_provider/counter_multi_bloc.dart';
import 'package:flutter_tutorial/multi_bloc_provider/thema_multi_bloc.dart';

void main() {
  runApp(MainMultiBloc());
}

class MainMultiBloc extends StatelessWidget {
  const MainMultiBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData dark = ThemeData.dark();
    final ThemeData light = ThemeData.light();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeMultiBloc(),
        ),
        BlocProvider(create: (context) => CounterMultiBloc())
      ],
      child: BlocBuilder<ThemeMultiBloc, bool>(
          builder: (context, state) => MaterialApp(
                theme: state ? dark : light,
                home: HomePageMultiBloc(),
              )),
    );
  }
}

class HomePageMultiBloc extends StatelessWidget {
  const HomePageMultiBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Apps"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterMultiBloc, int>(
              builder: (context, state) => Text(
                "Angka Saat ini : $state",
                style: const TextStyle(fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () =>
                        context.read<CounterMultiBloc>().decrement(),
                    icon: const Icon(Icons.remove)),
                IconButton(
                    onPressed: () =>
                        context.read<CounterMultiBloc>().increment(),
                    icon: const Icon(Icons.add)),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<ThemeMultiBloc>().changeTheme(),
        child: Icon(Icons.color_lens),
      ),
    );
  }
}
