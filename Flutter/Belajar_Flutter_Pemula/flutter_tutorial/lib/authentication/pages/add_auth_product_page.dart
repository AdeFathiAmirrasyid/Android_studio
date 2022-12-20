import 'package:flutter/material.dart';
import 'package:flutter_tutorial/authentication/providers/auth_products.dart';
import 'package:provider/provider.dart';

class AddAuthProductPage extends StatelessWidget {
  static const route = "/add-product";
  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  AddAuthProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void save(String title, String price) {
      try {
        Provider.of<AuthProducts>(context, listen: false)
            .addProduct(title, price)
            .then((value) => Navigator.pop(context));
      } catch (error) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Error Occured"),
              content: Text("Error : $error"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Okay"),
                )
              ],
            );
          },
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
        actions: [
          IconButton(
              onPressed: () => save(titleController.text, priceController.text),
              icon: const Icon(Icons.save)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TextField(
                  autocorrect: false,
                  autofocus: true,
                  controller: titleController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      labelText: "Product Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                const SizedBox(height: 20),
                TextField(
                  autocorrect: false,
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      labelText: "Price",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                )
              ],
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 30),
              child: ElevatedButton(
                onPressed: () =>
                    save(titleController.text, priceController.text),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100))),
                child: const Text(
                  "Save",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
