import 'package:flutter/material.dart';
import 'package:flutter_tutorial/consumer_provider/providers/cart_consumer.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartConsumer>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(20),
            child: Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Total : \$ ${cartData.totalHarga}",
                  style: TextStyle(fontSize: 50),
                )),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: cartData.jumlah,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("${cartData.items.values.toList()[index].title}"),
                      subtitle: Text("${cartData.items.values.toList()[index].qty}"),
                      trailing: Container(child: Text("\$ ${cartData.items.values.toList()[index].qty * cartData.items.values.toList()[index].price}"),),
                    );
                  }))
        ],
      ),
    );
  }
}
