import 'package:firebasetest/services/network.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: InkWell(
            onTap: (){
              loginWithGoogle();
            },
            child: Container(
        padding: const EdgeInsets.all(8),
        color: Colors.blue,
        child: const Text(
            "Login Using Google",
            style: TextStyle(color: Colors.white),
        ),
      ),
          )),
    );
  }
}
