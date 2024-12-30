import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:one/homepage.dart';
import 'package:one/provider.dart';
import 'package:one/view/LoginPage/login.dart';
import 'package:one/view_model/userprovider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => StudentProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Userprovider(),
        ),
      ],
      child: MaterialApp(
        home: LoginPage(),
      ),
    );
  }
}
