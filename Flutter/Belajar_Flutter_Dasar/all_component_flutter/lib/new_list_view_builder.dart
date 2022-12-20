import 'dart:math';

import 'package:all_component_flutter/product_card/new_product_card_example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ERROR
class NewListViewBuilder extends StatelessWidget {
  const NewListViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MainNewListView()
    );
  }
}

class MainNewListView extends StatelessWidget {
  final Random r = Random();
  MainNewListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewProductBloc bloc = BlocProvider.of<NewProductBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo ListView Builder"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                bloc.dispath(r.nextInt(4) + 2);
              },
              child: Text("Create Product")),
          SizedBox(
            height: 20,
          ),
          BlocBuilder<NewProductBloc, List<Product>>(
              builder: (context, products) => Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return NewProductCardExample(
                          imageURL: products[index].imageURL,
                          name: products[index].name,
                          price: products[index].price.toString(),
                          onAddCartTap: () {},
                          onIncTap: () {},
                          onDecTap: () {},
                        );
                      },
                    ),
                  ))
        ],
      ),
    );
  }
}

class Product {
  String imageURL;
  String name;
  int price;

  Product({this.imageURL = "", this.name = "", this.price = 0});
}

class NewProductBloc extends Bloc<int, List<Product>> {
  NewProductBloc(super.initialState);

  List<Product> get initialState => [];

  Stream<List<Product>> mapEventToState(int event) async* {
    List<Product> products = [];
    for (int i = 0; i < event; i++) {
      products.add(Product(
          imageURL:
              "https://images.unsplash.com/photo-1498050108023-c5249f4df085?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=872&q=80",
          name: "Product $i",
          price: (i + 1) * 5000));
      yield products;
    }
  }

  void dispath(int i) {}
}
