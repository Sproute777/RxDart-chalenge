import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stream_search/pages/rb_example.dart';
import 'dart:convert';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => RBExample(),
      },
    );
  }
}