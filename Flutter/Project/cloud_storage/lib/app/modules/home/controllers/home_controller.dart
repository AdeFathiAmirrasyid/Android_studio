import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as s;
import 'package:get/get.dart';

class HomeController extends GetxController {
  s.FirebaseStorage storage = s.FirebaseStorage.instance;
  void akses() async {
    // String dataUrl = 'data:text/plain;base64,SGVsbG8sIFdvcmxkIQ==';
    // var myRef = storage.ref('hello.txt');
    // var myList = await myRef.listAll();
    //
    // print("Banyak data : ${myList.items.length}");
    //
    // myList.items.forEach((element) async{
    //   final url = await storage.ref(element.name).getDownloadURL();
    //   print(url);
    // });

    // myRef.putString(dataUrl, format: firebase_storage.PutStringFormat.dataUrl);

    // Put data low level
    // String text = 'Ade Fathi Amirrasyid';
    // List<int> encoded = utf8.encode(text);
    // Uint8List data = Uint8List.fromList(encoded);
    //
    // s.Reference reference =
    //     s.FirebaseStorage.instance.ref('upload/hello-world.text');
    // await reference.putData(data);

    // Metadata
    var myRef = storage.ref('dataWithMetadata.txt');
    s.SettableMetadata metadata = s.SettableMetadata(
        cacheControl: 'max-age-=60',
        customMetadata: <String, String>{
          'userId': 'ABC123',
        });
    myRef.putString("Hello World!", metadata: metadata);
  }

  // File Picker
  void uploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null) {
      // File file = File(result.files.single.path!);
      // print(file);
      // String fileName = result.files.single.name;
      // String ext = result.files.single.extension!;
      // try {
      //   await s.FirebaseStorage.instance.ref("$fileName. $ext").putFile(file);
      //   print('Berhasil upload data');
      // } catch (err) {
      //   print(err);
      // }

      // Multiple upload
      result.files.forEach((element) async {
        String name = element.name;
        File file = File(element.path!);
        print("Berhasil Upload Multiple File");
        try {
          await s.FirebaseStorage.instance.ref(name).putFile(file);
        } on s.FirebaseStorage catch (error) {
          print("ERROR file upload");
        }
      });
    } else {
      print("Membatalkan file upload");
    }
  }
}
