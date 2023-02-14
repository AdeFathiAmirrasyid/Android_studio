import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  bool active;
  IconData tabIcon;
  TabItem({required this.active, required this.tabIcon, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(
                        color: active == true ? Colors.black : Colors.white, width: 1))),
            child: Icon(tabIcon)));
  }
}
