import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screen/home/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(theme: ThemeData(
        canvasColor: Color.fromARGB(255, 3, 38, 66), // Set the background color here
        // Rest of your theme configurations
      ),
      home: Home(),
    );
  }
}
