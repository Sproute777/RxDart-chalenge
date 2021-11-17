import 'dart:async';
import 'package:flutter_stream_search/pages/stage4/contact_model.dart';
import 'package:flutter_stream_search/pages/stage4/contact_service.dart';
import 'package:rxdart/rxdart.dart';


class ContactManager{
    final BehaviorSubject<int> _contactCounter = BehaviorSubject<int>();
    Stream<int> get contactCounter => _contactCounter.stream;

 
  Stream<List<Contact>> get contactListNow =>
   Stream.fromFuture(ContactService.fetchUsers()) ;


  Stream<List<Contact>> filteredCollection({query}) =>
   Stream.fromFuture(ContactService.fetchUsers(query: query)) ;

    
  


ContactManager(){
  contactListNow.listen((event) { _contactCounter.add(event.length); });
}
}