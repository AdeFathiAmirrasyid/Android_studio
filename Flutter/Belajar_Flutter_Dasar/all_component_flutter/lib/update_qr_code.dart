import 'package:flutter/material.dart';
// import 'package:qrscan/qrscan.dart' as scanner;

class UpdateQrCode extends StatelessWidget {
  const UpdateQrCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainUpdateQrCode(),
    );
  }
}

class MainUpdateQrCode extends StatefulWidget {
  const MainUpdateQrCode({Key? key}) : super(key: key);

  @override
  State<MainUpdateQrCode> createState() => _MainUpdateQrCodeState();
}

class _MainUpdateQrCodeState extends State<MainUpdateQrCode> {
  String text = "Hasil QR Scan";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Scan"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                // String? text = await scanner.scan();
                  setState(() {});
                },
                child: Text("Scan"))
          ],
        ),
      ),
    );
  }
}
