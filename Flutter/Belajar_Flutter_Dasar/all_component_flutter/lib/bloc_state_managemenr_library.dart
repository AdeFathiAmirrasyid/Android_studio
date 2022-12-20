import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_state_library/color_bloc_library.dart';

//Library Gagal
class BlocStateManagementLibrary extends StatelessWidget {
  const BlocStateManagementLibrary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: BlocProvider<ColorBloc>(
        create: (context) => ColorBloc(Colors.amber),
        child: const MainLibraryPage(),
      ),
    );
  }
}

class MainLibraryPage extends StatelessWidget {
  const MainLibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorBloc bloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.amber,
            onPressed: () {

            },
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {

            },
            backgroundColor: Colors.lightBlue,
          )
        ],
      ),
      appBar: AppBar(
        title: const Text("Bloc dengan flutter bloc"),
      ),
      body: Center(
        child: BlocBuilder<ColorBloc, Color>(
          builder: (context, currentColor) => AnimatedContainer(
            width: 100,
            height: 100,
            color: currentColor,
            duration: const Duration(milliseconds: 500),
          ),
        )
      ),
    );
  }
}




