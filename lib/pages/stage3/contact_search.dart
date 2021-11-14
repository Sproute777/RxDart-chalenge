import 'package:flutter/material.dart';
import 'package:flutter_stream_search/pages/stage3/contact_model.dart';
import 'package:flutter_stream_search/pages/stage3/contact_list_builder.dart';

class ContactSearchDelegate extends SearchDelegate {
  final manager;
  ContactSearchDelegate({this.manager});
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
   if(query.length < 3){
     return const Center(child: Text('Type at least 3 letters to seatch'),);
   }
    return ContactListBuilder(
      stream: manager.filteredCollection(query: query),
      builder: (context, contacts){
         return ListView.separated(
           itemBuilder: (BuildContext context, int index){
             return ListTile(
               title: Text(contacts[index].name),
               subtitle: Text(contacts[index].email),
               leading: const CircleAvatar(),
             );
           },
            separatorBuilder: (context, index)=> const Divider(),
             itemCount: contacts?.length ?? 0
             );
      },
    );    
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
  
}
