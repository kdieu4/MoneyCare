import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:money_care/presentation/component/home_page.dart';

import 'core/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ✅ Must be first!
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
    );
  }
}

