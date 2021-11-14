
import 'dart:async';

import 'package:flutter_stream_search/pages/stage2/contact2.dart';
import 'package:flutter_stream_search/pages/stage2/contact_service2.dart';

List<String> contacts = ["User 1", "User 2", "User 3", "User 4", "User 5" ];

class ContactManager2{

  Stream<List<Contact2>> get contactListNow async*{
     yield await ContactService2.fetchUsers() as List<Contact2>;

    }
  

final StreamController<int> _contactCounter = StreamController<int>();
Stream<int> get contactCounter => _contactCounter.stream;

ContactManager2(){
  contactListNow.listen((event) { _contactCounter.add(event.length); });
}
}