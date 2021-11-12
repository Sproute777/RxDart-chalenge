import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stream_search/pages/stage0/rb_example.dart';
import 'dart:convert';

import 'package:flutter_stream_search/pages/stage1/stream_stage1.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/stage1",
      routes: {
        "/": (context) => Stage0(),
        "/stage1":(context) => Stage1(),
      },
    );
  }
}