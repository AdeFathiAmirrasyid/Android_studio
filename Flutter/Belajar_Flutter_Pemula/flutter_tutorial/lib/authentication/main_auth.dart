import 'package:flutter/material.dart';
import 'package:flutter_tutorial/authentication/pages/add_auth_product_page.dart';
import 'package:flutter_tutorial/authentication/pages/edit_auth_product_page.dart';
import 'package:flutter_tutorial/authentication/pages/home_auth_page.dart';
import 'package:flutter_tutorial/authentication/pages/login/login.dart';
import 'package:flutter_tutorial/authentication/providers/auth.dart';
import 'package:flutter_tutorial/authentication/providers/auth_products.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainAuth());
}

class MainAuth extends StatelessWidget {
  const MainAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => AuthProviders(),
          ),
          ChangeNotifierProxyProvider<AuthProviders, AuthProducts>(
              create: (context) => AuthProducts(),
              update: (context, auth, products) =>
                  products!..updateData(auth.token, auth.userId))
        ],
        builder: (context, child) => Consumer<AuthProviders>(
              builder: (context, auth, child) => MaterialApp(
                debugShowCheckedModeBanner: false,
                home: auth.isAuth
                    ? const HomeAuthPage()
                    : FutureBuilder(
                        future: auth.autoLogin(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Scaffold(
                              body: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }
                          return const LoginPage();
                        }),
                routes: {
                  AddAuthProductPage.route: (context) => AddAuthProductPage(),
                  EditAuthProductPage.route: (context) =>
                      const EditAuthProductPage(),
                },
              ),
            ));
  }
}
