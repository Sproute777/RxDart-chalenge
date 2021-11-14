
import 'dart:async';

import 'package:flutter_stream_search/pages/stage3/contact3.dart';
import 'package:flutter_stream_search/pages/stage3/contact_service3.dart';


List<String> contacts = ["User 1", "User 2", "User 3", "User 4", "User 5" ];

class ContactManager3{

  Stream<List<Contact3>> get contactListNow async*{
     yield await ContactService3.fetchUsers() as List<Contact3>;

    }
  

final StreamController<int> _contactCounter = StreamController<int>();
Stream<int> get contactCounter => _contactCounter.stream;

ContactManager3(){
  contactListNow.listen((event) { _contactCounter.add(event.length); });
}
}