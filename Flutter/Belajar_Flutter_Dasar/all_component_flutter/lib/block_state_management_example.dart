import 'package:all_component_flutter/block_state/color_bloc.dart';
import 'package:flutter/material.dart';

class BlockStateManagementExample extends StatefulWidget {
  const BlockStateManagementExample({Key? key}) : super(key: key);

  @override
  State<BlockStateManagementExample> createState() =>
      _BlockStateManagementExampleState();
}

class _BlockStateManagementExampleState
    extends State<BlockStateManagementExample> {
  ColorBloc bloc = ColorBloc();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.amber,
              onPressed: () {
                bloc.eventSink.add(ColorEvent.to_amber);
              },
            ),
            const SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              backgroundColor: Colors.lightBlue,
              onPressed: () {
                bloc.eventSink.add(ColorEvent.to_light_blue);
              },
            )
          ],
        ),
        appBar: AppBar(
          title: const Text("Block tanpa library"),
        ),
        body: Center(
          child: StreamBuilder(
              stream: bloc.stateStream,
              initialData: Colors.amber,
              builder: (context, snapshot) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: 100,
                  height: 100,
                  color: snapshot.data,
                );
              }),
        ),
      ),
    );
  }
}
