import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectbarujihan/screen_dua.dart';
import 'package:projectbarujihan/screen_satu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
          GetPage(name: "/", page:() => MyApp()),
          GetPage(name: "/dua", page:() => screenDua()),
      ],
      home: screenSatu(),
    );
  }
}
