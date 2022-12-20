import 'package:flutter/material.dart';
import 'package:flutter_tutorial/authentication/pages/add_auth_product_page.dart';
import 'package:flutter_tutorial/authentication/providers/auth.dart';
import 'package:provider/provider.dart';
import '../providers/auth_products.dart';
import '../widgets/product_item_auth.dart';

class HomeAuthPage extends StatefulWidget {
  const HomeAuthPage({super.key});

  @override
  State<HomeAuthPage> createState() => _HomeAuthPageState();
}

class _HomeAuthPageState extends State<HomeAuthPage> {
  bool isInit = true;
  bool isLoading = false;

  @override
  void didChangeDependencies() {
    if (isInit) {
      isLoading = true;
      Provider.of<AuthProducts>(context, listen: false)
          .initialData()
          .then((value) {
        setState(() {
          isLoading = false;
        });
      }).catchError((err) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Error Occurred"),
              content: Text(err.toString()),
              actions: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        isLoading = false;
                      });
                      Navigator.pop(context);
                    },
                    child: const Text("okay"))
              ],
            );
          },
        );
      });
      isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<AuthProducts>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Product"),
        actions: [
          IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, AddAuthProductPage.route),
              icon: const Icon(Icons.add)),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () =>
                Provider.of<AuthProviders>(context, listen: false).logout(),
          )
        ],
      ),
      body: (isLoading)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : (prov.allProduct.isEmpty)
              ? const Center(
                  child: Text(
                    "No Data",
                    style: TextStyle(fontSize: 25),
                  ),
                )
              : ListView.builder(
                  itemCount: prov.allProduct.length,
                  itemBuilder: (context, index) => ProductItemAuth(
                    prov.allProduct[index].id,
                    prov.allProduct[index].title,
                    prov.allProduct[index].price,
                    prov.allProduct[index].updatedAt,
                  ),
                ),
    );
  }
}
