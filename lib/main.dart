import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'screen/home/view/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // if (!Hive.isAdapterRegistered(CategoryTypeAdapter().typeId)) {
  //   Hive.registerAdapter(CategoryTypeAdapter());
  // }

  // if (!Hive.isAdapterRegistered(CategoryModelAdapter().typeId)) {
  //   Hive.registerAdapter(CategoryModelAdapter());
  // }
  // if (!Hive.isAdapterRegistered(TransationModelAdapter().typeId)) {
  //   Hive.registerAdapter(TransationModelAdapter());
  // }
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
