import 'package:flutter/material.dart';
import 'package:flutter_stream_search/pages/stage4/contact_list_builder.dart';
import 'package:flutter_stream_search/pages/stage4/contact_manager.dart';
import 'package:flutter_stream_search/pages/stage4/contact_model.dart';
import 'package:flutter_stream_search/pages/stage4/provider_inherited.dart';

class ContactSearchDelegate extends SearchDelegate {
  ContactSearchDelegate();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
    IconButton(
      icon: const Icon(Icons.clear),
      onPressed: () {
         query = '';
      },)
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
      close(context, null);
      },);
  }

  @override
  Widget buildResults(BuildContext context) {
  ContactManager _manager = Provider.of(context);
   if(query.length < 3){
     return const Center(child: Text('Type at least 3 letters to seatch'),);
   }
    return ContactListBuilder(
      query: query,
      builder: (context,  List<Contact> contacts){
         return ListView.separated(
           itemCount: contacts.length ,
           itemBuilder: (BuildContext context, int index){
             return ListTile(
               title: Text(contacts[index].name),
               subtitle: Text(contacts[index].email),
               leading: const CircleAvatar(),
             );
           },
            separatorBuilder: (context, index)=> const Divider(),
             );
      },
    );    
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
  
}
