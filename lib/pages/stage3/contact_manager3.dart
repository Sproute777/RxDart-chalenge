import 'dart:async';
import 'package:flutter_stream_search/pages/stage3/contact3.dart';
import 'package:flutter_stream_search/pages/stage3/contact_service3.dart';


class ContactManager3{
  Stream<List<Contact3>> get contactListNow =>
   Stream.fromFuture(ContactService3.fetchUsers()) ;


  Stream<List<Contact3>> filteredCollection({query}) =>
   Stream.fromFuture(ContactService3.fetchUsers(query: query)) ;

    
  

final StreamController<int> _contactCounter = StreamController<int>();
Stream<int> get contactCounter => _contactCounter.stream;

ContactManager3(){
  contactListNow.listen((event) { _contactCounter.add(event.length); });
}
}