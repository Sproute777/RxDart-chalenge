import 'package:flutter/material.dart';
import 'package:flutter_stream_search/pages/stage4/contact_manager.dart';

class Provider extends InheritedWidget {
  final ContactManager data;
    final Widget child;
   const Provider({Key? key, required this.child, required this.data}) : super(key: key, child: child);

 static ContactManager of(BuildContext context){
    return (context.dependOnInheritedWidgetOfExactType<Provider>() as Provider).data;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}