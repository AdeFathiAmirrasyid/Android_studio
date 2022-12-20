import 'package:flutter/material.dart';

void main() {
  runApp(MainTheme());
}

class MainTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ThemePage(),
      theme: ThemeData(
          // brightness: Brightness.dark,
          // visualDensity: VisualDensity.adaptivePlatformDensity
          // visualDensity: VisualDensity.comfortable
          // visualDensity: VisualDensity.compact
          // visualDensity: VisualDensity(horizontal: 4, vertical: 4)
          // primaryColor: Colors.amber,
          // primarySwatch: Colors.indigo,
          // primaryColor: const Color(0xFFF5E0C3),
          // primarySwatch: const MaterialColor(
          //   0xFFF5E0C3,
          //   <int, Color>{
          //     50: Color(0xFFFFF8E1),
          //     100: Color(0xFFFFECB3),
          //     200: Color(0xFFFFE082),
          //     300: Color(0xFFFFD54F),
          //     400: Color(0xFFFFCA28),
          //     500: Color(0xFFFFCA28),
          //     600: Color(0xFFFFB300),
          //     700: Color(0xFFFFA000),
          //     800: Color(0xFFFF8F00),
          //     900: Color(0xFFFF6F00),
          //   },
          // ),

          // accentColor: Colors.amber
          textTheme: const TextTheme(
              bodyText2: TextStyle(color: Colors.amber, fontFamily: "Viga"))),
    );
  }
}

class ThemePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learning Theme"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "This is a text",
              style: TextStyle(fontSize: 35),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "This is a text",
              style: TextStyle(fontSize: 35),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Button",
                  style: TextStyle(fontSize: 35),
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {}, child: Icon(Icons.ac_unit_outlined)),
    );
  }
}
