import 'package:all_component_flutter/media_query/media_page.dart';
import 'package:flutter/material.dart';


class MediaQueryExample extends StatelessWidget {
  const MediaQueryExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MediaPage(),
    );
  }
}
