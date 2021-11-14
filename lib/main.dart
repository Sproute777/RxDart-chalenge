import 'package:flutter/material.dart';
import 'package:flutter_stream_search/pages/stage0/stage0_page.dart';
import 'package:flutter_stream_search/pages/stage1/stage1_page.dart';
import 'package:flutter_stream_search/pages/stage2/stage2_page.dart';
import 'package:flutter_stream_search/pages/stage3/stage3_page.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/stage3",
      routes: {
        '/': (context) => Stage0(),
        '/stage1':(context)=> Stage1(),
        '/stage2':(context)=> Stage2(),
        '/stage3':(context)=> Stage3(), 
      },
    );
  }
}