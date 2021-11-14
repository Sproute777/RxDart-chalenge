import 'dart:async';
import 'dart:convert';

import 'package:flutter_stream_search/pages/stage3/contact3.dart';
import 'package:http/http.dart' as http;

class ContactService3 {
  static const String _url = "https://jsonplaceholder.typicode.com/users";

  static Future fetchUsers() async {
   http.Response response = await http.get(Uri.parse(_url));
   await Future.delayed( const Duration(seconds: 3));

   String content = response.body;
   List collection = json.decode(content);
   List<Contact3> _messages = 
   collection.map((json)=> Contact3.fromJson(json)).toList();
   print("lenght contact2 is ${_messages.length}");
   return _messages;
  }
}
