import 'package:flutter/material.dart';
import 'package:flutter_tutorial/http_request_get_put/models/http_provider_get_put.dart';
import 'package:flutter_tutorial/http_request_get_put/pages/home_provider_get_put.dart';
import 'package:flutter_tutorial/http_request_get_put/pages/home_statefull_get_put.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainRequest());
}
//========== StateFull ==========//
// class MainRequest extends StatelessWidget {
//   const MainRequest({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomeStateFullGetPut(),
//     );
//   }
// }

//========== StateLess ==========//
class MainRequest extends StatelessWidget {
  const MainRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ChangeNotifierProvider(
            create: (context) => HttpProviderGetPut(),
            child: const HomeProviderGetPut()));
  }
}
