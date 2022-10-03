import 'package:firebase_core/firebase_core.dart';
import 'package:firebasetest/ui/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyAMceg7Zz6xYq6t8fV7lC5-Hbj23_zOg-o",
        authDomain: "urbanaut.firebaseapp.com",
        databaseURL: "https://urbanaut.firebaseio.com",
        projectId: "urbanaut",
        storageBucket: "urbanaut.appspot.com",
        messagingSenderId: "373813257215",
        appId: "1:373813257215:web:af905e6d70ec46e06efdca",
        measurementId: "G-P7X5GKG8EM",

      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sign up Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Google Sign Login'),
    );
  }
}


