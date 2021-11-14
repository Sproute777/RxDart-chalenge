import 'dart:async';
import 'dart:convert';
import 'package:flutter_stream_search/pages/stage2/contact_model.dart';
import 'package:http/http.dart' as http;

class ContactService {
  static const String _url = "https://jsonplaceholder.typicode.com/users";

  static Future fetchUsers() async {
   http.Response response = await http.get(Uri.parse(_url));
   await Future.delayed( const Duration(seconds: 3));

   String content = response.body;
   List collection = json.decode(content);
   List<Contact> _messages = 
   collection.map((json)=> Contact.fromJson(json)).toList();
   print("lenght contact is ${_messages.length}");
   return _messages;
  }
}
