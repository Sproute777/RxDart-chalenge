import 'package:flutter/material.dart';
import 'package:flutter_stream_search/pages/stage4/contact_manager.dart';
import 'package:flutter_stream_search/pages/stage4/provider_inherited.dart';

class ContactCounter extends StatelessWidget {
  const ContactCounter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   ContactManager manager = Provider.of(context);

    return Chip(
       label: StreamBuilder<int>(
       stream: manager.contactCounter,
       builder: (context, snapshot){
         return  Text(
    (snapshot.data ?? 0).toString(),
     style: const TextStyle(
         color: Colors.white,
         fontWeight: FontWeight.bold
    ),
             );
             },
           ),
           backgroundColor: Colors.purple,
          );
  }
}