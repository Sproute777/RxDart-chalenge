import 'dart:async';
import 'dart:convert';

import 'package:flutter_stream_search/pages/stage3/contact3.dart';
import 'package:http/http.dart' as http;

class ContactService3 {
  static const String _url = "https://jsonplaceholder.typicode.com/users";

  static Future<List<Contact3>> fetchUsers({query}) async {

   http.Response response = await http.get(Uri.parse(_url));
   await Future.delayed( const Duration(seconds: 3));

   String content = response.body;
   List collection = json.decode(content);

   Iterable<Contact3> _contacts = 
   collection.map((_)=> Contact3.fromJson(_));
 if(query != null && query.isNotEmpty){
   _contacts = _contacts.where((contact) => contact.name.toLowerCase().contains(query));
 }
   return _contacts.toList();
  }
}
