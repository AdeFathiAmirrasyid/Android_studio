import 'package:flutter/material.dart';
import 'package:fundamental_flutter/calculator/widget/calculator_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      theme: ThemeData(backgroundColor: Colors.white),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String screenText = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
            color: Theme.of(context).primaryColor,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                screenText,
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Colors.white),
              ),
            ),
          )),
          GridView.count(
            padding: const EdgeInsets.all(10),
            shrinkWrap: true,
            crossAxisCount: 4,
            children: [
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: 'C',
                onTap: () {
                  setState(() {
                    screenText = '0';
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '+/-',
                onTap: () {

                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '%',
                onTap: () {},
              ),
              CalculatorButton.Icon(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Theme.of(context).primaryColorLight,
                text: 'Backspace',
                icon: Icons.backspace,
                onTap: () {
                  setState(() {
                    if (screenText == '0' ||
                        screenText == '' ||
                        screenText.length == 1) {
                      screenText = '0';
                    } else {
                      screenText =
                          screenText.substring(0, screenText.length - 1);
                    }
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '7',
                onTap: () {
                  pressNumber(7);
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '8',
                onTap: () {
                  pressNumber(8);
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '9',
                onTap: () {
                  pressNumber(9);
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Theme.of(context).primaryColorLight,
                text: '/',
                onTap: () {

                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '4',
                onTap: () {
                  pressNumber(4);
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '5',
                onTap: () {
                  pressNumber(5);
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '6',
                onTap: () {
                  pressNumber(6);
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Theme.of(context).primaryColorLight,
                text: 'X',
                onTap: () {},
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '1',
                onTap: () {
                  pressNumber(1);
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '2',
                onTap: () {
                  pressNumber(2);
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '3',
                onTap: () {
                  pressNumber(3);
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Theme.of(context).primaryColorLight,
                text: '-',
                onTap: () {},
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '0',
                onTap: () {
                  pressNumber(0);
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '.',
                onTap: () {
                  setState(() {
                    if(!screenText.contains('.')){
                      screenText = '$screenText.';
                    }
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '=',
                onTap: () {},
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Theme.of(context).primaryColorLight,
                text: '+',
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  void pressNumber(int number) {
    setState(() {
      if (screenText == '0') {
        screenText = '$number';
      } else {
        screenText = '$screenText$number';
      }
    });
  }
}
