import 'package:flutter/material.dart';
import 'package:flutter_tutorial/key/providers/providers_products.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key? key}) : super(key: key);
  static const routeName = '/add-product';

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  TextEditingController titleController = TextEditingController();

  DateTime? date;

  @override
  Widget build(BuildContext context) {
    var products = Provider.of<ProvidersProducts>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
        actions: [
          IconButton(
              onPressed: () {
                products.addProduct(titleController.text, date!);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          child: Column(
            children: [
              TextField(
                autocorrect: false,
                controller: titleController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    labelText: "Product Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      (date == null)
                          ? "No date chosen..."
                          : DateFormat().add_yMMMMd().format(date!),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2022),
                                  lastDate: DateTime(2025))
                              .then((value) {
                            setState(() {
                              date = value;
                            });
                          });
                        },
                        child: const Text(
                          "Select Date",
                          style: TextStyle(fontSize: 16),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
