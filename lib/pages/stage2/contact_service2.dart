import 'dart:async';
import 'dart:convert';
import 'package:flutter_stream_search/pages/stage2/contact2.dart';
import 'package:http/http.dart' as http;

class ContactService2 {
  static const String _url = "https://jsonplaceholder.typicode.com/users";

  static Future fetchUsers() async {
   http.Response response = await http.get(Uri.parse(_url));
   await Future.delayed( const Duration(seconds: 3));

   String content = response.body;
   List collection = json.decode(content);
   List<Contact2> _messages = 
   collection.map((json)=> Contact2.fromJson(json)).toList();
   print("lenght contact2 is ${_messages.length}");
   return _messages;
  }
}
