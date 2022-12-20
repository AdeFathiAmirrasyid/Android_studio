import 'package:flutter/material.dart';
import 'package:flutter_tutorial/checkbox/providers/colors.dart';
import 'package:provider/provider.dart';

class AddColorPageCheckBox extends StatelessWidget {
  AddColorPageCheckBox({Key? key}) : super(key: key);
  static const routeName = "/add";

  final TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var colorClass = Provider.of<MultiColor>(context, listen: false);
    void saveData() {
      colorClass.addColor(titleController.text);
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Color page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
          child: Column(
            children: [
              TextField(
                autocorrect: false,
                autofocus: true,
                controller: titleController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    labelText: "Input Color",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40))),
                onEditingComplete: saveData,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: saveData,
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  )),
                  child: const Text("Save"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
