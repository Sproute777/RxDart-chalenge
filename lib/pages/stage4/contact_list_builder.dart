import 'package:flutter/material.dart';

import 'package:flutter_stream_search/pages/stage4/contact_manager.dart';
import 'package:flutter_stream_search/pages/stage4/contact_model.dart';
import 'package:flutter_stream_search/pages/stage4/provider_inherited.dart';

class ContactListBuilder extends StatelessWidget {
  final Function builder;
  String? query;
   ContactListBuilder({
    Key? key,
    required this.builder,
    this.query,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ContactManager manager = Provider.of(context);

    return  StreamBuilder<List<Contact>>(
          stream: (query == null) ? manager.contactListNow : manager.filteredCollection(query: query),
          builder: (context,  AsyncSnapshot<List<Contact>> snapshot){      
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                case ConnectionState.active:
                  return const Center(child: CircularProgressIndicator(),);  

                case ConnectionState.done:             
            List<Contact> contacts = snapshot.data!;
            return builder(context, contacts);
          } }
           );    
  }
}
