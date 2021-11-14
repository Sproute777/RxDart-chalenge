
import 'package:flutter/material.dart';
import 'package:flutter_stream_search/pages/stage2/contact2.dart';
import 'package:flutter_stream_search/pages/stage2/contact_manager2.dart';

class Stage2 extends StatelessWidget {
   Stage2({Key? key}) : super(key: key);
ContactManager2 manager = ContactManager2();

  @override
  Widget build(BuildContext context) {
   return  Scaffold(
            appBar: AppBar(title: const Text("stage2 stream easy"),
               leading:  Chip(
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
          )
        ),
        body: StreamBuilder<List<Contact2>>(

          stream: manager.contactListNow,
          builder: (context,  AsyncSnapshot<List<Contact2>> snapshot){
         
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                case ConnectionState.active:
                  return const Center(child: CircularProgressIndicator(),);  

                case ConnectionState.done:             
            List<Contact2> contacts = snapshot.data!;
            return ListView.separated(
              padding: const EdgeInsets.only(right: 100),
              cacheExtent: 100,
              itemBuilder: (context,int index){
                Contact2 _contact = contacts[index];
                return ListTile(
                  title: Text(_contact.name),
                  subtitle: Text(_contact.email),             
                );
              },
               separatorBuilder: (context, indext)=>const  Divider(),
                itemCount: contacts.length );
          } }
           ),      
    );
  }
}