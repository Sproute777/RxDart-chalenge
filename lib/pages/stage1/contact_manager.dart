
import 'dart:async';

List<String> contacts = ["User 1", "User 2", "User 3", "User 4", "User 5" ];

class ContactManager{

  Stream<List<String>> get contactListNow async*{
    for(var i = 0; i < contacts.length; i++){
      await Future.delayed(const Duration(seconds: 2));
      yield contacts.sublist(0 , i + 1 );
    }
  }

final StreamController<int> _contactCounter = StreamController<int>();
Stream<int> get contactCounter => _contactCounter.stream;

ContactManager(){
  contactListNow.listen((event) { _contactCounter.add(event.length); });
}
}