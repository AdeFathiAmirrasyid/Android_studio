import 'package:flutter/material.dart';
import 'package:flutter_tutorial/authentication/pages/edit_auth_product_page.dart';
import 'package:flutter_tutorial/authentication/providers/auth_products.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProductItemAuth extends StatelessWidget {
  final String id, title, price;
  final DateTime updatedAt;
  const ProductItemAuth(this.id, this.title, this.price, this.updatedAt,
      {super.key});

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<AuthProducts>(context, listen: false);
    String date = DateFormat.yMMMd().add_Hms().format(updatedAt);
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, EditAuthProductPage.route, arguments: id);
      },
      leading: CircleAvatar(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: FittedBox(
            child: Text("\$$price"),
          ),
        ),
      ),
      title: Text(title),
      subtitle: Text("Last Edited : $date"),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          prov.deleteProduct(id);
        },
      ),
    );
  }
}
