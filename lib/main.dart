import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:huntechelp_admin/pages/main_page.dart';
import 'util.dart';
import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures that Flutter is ready before initializing Firebase
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "ABeeZee", "ABeeZee");

    MaterialTheme theme = MaterialTheme(textTheme);
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Health App',
      theme: theme.light(), // Always use the light theme
      home: const MainPage(),
    );
  }
}
