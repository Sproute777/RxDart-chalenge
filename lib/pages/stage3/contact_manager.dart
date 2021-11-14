import 'dart:async';
import 'package:flutter_stream_search/pages/stage3/contact_model.dart';
import 'package:flutter_stream_search/pages/stage3/contact_service.dart';


class ContactManager{
  Stream<List<Contact>> get contactListNow =>
   Stream.fromFuture(ContactService.fetchUsers()) ;


  Stream<List<Contact>> filteredCollection({query}) =>
   Stream.fromFuture(ContactService.fetchUsers(query: query)) ;

    
  

final StreamController<int> _contactCounter = StreamController<int>();
Stream<int> get contactCounter => _contactCounter.stream;

ContactManager(){
  contactListNow.listen((event) { _contactCounter.add(event.length); });
}
}