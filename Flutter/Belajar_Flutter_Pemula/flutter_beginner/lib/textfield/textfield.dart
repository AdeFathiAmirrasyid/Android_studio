import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isHidden = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login TextField"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: emailController,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: "Email",
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
              prefixIcon: const Icon(Icons.email),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: passwordController,
            autocorrect: false,
            obscureText: isHidden,
            decoration: InputDecoration(
                labelText: "Password",
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                prefixIcon: const Icon(Icons.vpn_key),
                suffixIcon: IconButton(
                  onPressed: () {
                    if (isHidden == true) {
                      isHidden = false;
                    } else {
                      isHidden = true;
                    }
                    setState(() {});
                  },
                  icon: isHidden == true
                      ? const Icon(Icons.remove_red_eye)
                      : const Icon(Icons.remove_red_eye_outlined),
                )),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              print(
                  "Email = ${emailController.text} dan Password = ${passwordController.text}");
            },
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                backgroundColor: Colors.red[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                )),
            child: const Text(
              "Login",
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
