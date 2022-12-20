import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocListenerApp());
}

class BlocListenerApp extends StatefulWidget {
  BlocListenerApp({Key? key}) : super(key: key);

  @override
  State<BlocListenerApp> createState() => _BlocListenerAppState();
}

class _BlocListenerAppState extends State<BlocListenerApp> {
  bool isDark = false;

  final ThemeData dark = ThemeData.dark();

  final ThemeData light = ThemeData.light();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterListenerBloc()),
        BlocProvider(create: (context) => ThemeListenerBloc()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<CounterListenerBloc, int>(
            listener: (context, state) {
              if (state > 10) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Lebih Dari 10"),
                  duration: Duration(microseconds: 500),
                ));
              }
              if (state % 1 == 0) {
                setState(() {
                  isDark = !isDark;
                });
              }
            },
          ),
        ],
        child: BlocBuilder<ThemeListenerBloc, bool>(
          builder: (context, state) => MaterialApp(
            theme: state == isDark ? dark : light,
            home: const HomePageListener(),
          ),
        ),
      ),
    );
  }
}

class HomePageListener extends StatelessWidget {
  const HomePageListener({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => context.read<ThemeListenerBloc>().changeTheme(),
              icon: const Icon(Icons.refresh))
        ],
        title: const Text("Bloc Listener"),
      ),
      body: Center(
        child: BlocListener<CounterListenerBloc, int>(
          listener: (context, state) {},
          child: BlocBuilder<CounterListenerBloc, int>(
            builder: (context, state) => Text(
              "$state",
              style: const TextStyle(fontSize: 25),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CounterListenerBloc>().increment(),
      ),
    );
  }
}

class CounterListenerBloc extends Cubit<int> {
  CounterListenerBloc() : super(0);
  void increment() => emit(state + 1);
}

class ThemeListenerBloc extends Cubit<bool> {
  ThemeListenerBloc() : super(false);
  void changeTheme() => emit(!state);
}
