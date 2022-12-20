import 'package:all_component_flutter/multi_provider/multi_provider_cart.dart';
import 'package:all_component_flutter/multi_provider/multi_provider_money.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiProviderStateManagement extends StatelessWidget {
  const MultiProviderStateManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MultiProvider(
      providers: [
        ChangeNotifierProvider<MultiProviderMoney>(
            create: (context) => MultiProviderMoney()),
        ChangeNotifierProvider<MultiProviderCart>(
            create: (context) => MultiProviderCart())
      ],
      child: Scaffold(
        floatingActionButton: Consumer<MultiProviderMoney>(
          builder: (context, multiProviderMoney, _) =>
              Consumer<MultiProviderCart>(
            builder: (context, multiProviderCart, _) => FloatingActionButton(
              onPressed: () {
                if (multiProviderMoney.belance >= 500) {
                  multiProviderCart.quantity += 1;
                  multiProviderMoney.belance -= 500;
                }
              },
              backgroundColor: Colors.purple,
              child: const Icon(Icons.add_shopping_cart),
            ),
          ),
        ),
        appBar: AppBar(
          title: const Text(
            "Multi Provider",
          ),
          backgroundColor: Colors.purple,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Belance"),
                  Container(
                    height: 30,
                    width: 150,
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.purple[100],
                        border: Border.all(color: Colors.purple, width: 2)),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Consumer<MultiProviderMoney>(
                        builder: (context, multiProviderMoney, _) => Text(
                          multiProviderMoney.belance.toString(),
                          style: const TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                  height: 30,
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black, width: 2)),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Consumer<MultiProviderCart>(
                        builder: (context, multiProviderCart, _) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Apple (500) x ${multiProviderCart.quantity}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  (500 * multiProviderCart.quantity).toString(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )),
                  ))
            ],
          ),
        ),
      ),
    ));
  }
}
