import 'package:flutter/material.dart';

void main() {
  runApp(const DatePickerExample());
}

class DatePickerExample extends StatelessWidget {
  const DatePickerExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageDatePicker(),
    );
  }
}

class PageDatePicker extends StatefulWidget {
  @override
  State<PageDatePicker> createState() => _PageDatePickerState();
}

class _PageDatePickerState extends State<PageDatePicker> {
  DateTime selectDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Date Picker"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              selectDate.toString(),
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () {
                showDatePicker(
                        context: context,
                        initialDate: selectDate,
                        firstDate: DateTime(1990),
                        lastDate: DateTime(2050),
                        selectableDayPredicate: (day) {
                          if ((day.isAfter(DateTime.now()
                                  .subtract(Duration(days: 5)))) &&
                              (day.isBefore(
                                  DateTime.now().add(Duration(days: 3))))) {
                            return true;
                          }
                          return false;
                        },
                        helpText: 'Help Text',
                        cancelText: 'Cancel Text',
                        confirmText: 'Confirm Text',
                        fieldHintText: 'Field Hint Text',
                        fieldLabelText: 'Field Label Text')
                    .then((value) {
                  setState(() {
                    selectDate = value!;
                  });
                });
              },
              child: const Text(
                "Date Picker",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
