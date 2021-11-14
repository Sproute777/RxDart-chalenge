
import 'dart:async';

import 'package:flutter_stream_search/pages/stage2/contact_model.dart';
import 'package:flutter_stream_search/pages/stage2/contact_service.dart';

List<String> contacts = ["User 1", "User 2", "User 3", "User 4", "User 5" ];

class ContactManager{

  Stream<List<Contact>> get contactListNow async*{
     yield await ContactService.fetchUsers() as List<Contact>;

    }
  

final StreamController<int> _contactCounter = StreamController<int>();
Stream<int> get contactCounter => _contactCounter.stream;

ContactManager(){
  contactListNow.listen((event) { _contactCounter.add(event.length); });
}
}