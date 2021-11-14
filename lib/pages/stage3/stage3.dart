import 'package:flutter/material.dart';
import 'package:flutter_stream_search/pages/stage3/contact3.dart';
import 'package:flutter_stream_search/pages/stage3/contact_manager3.dart';
import 'package:flutter_stream_search/pages/stage3/contact_search3.dart';

class Stage3 extends StatelessWidget {
  Stage3({Key? key}) : super(key: key);
ContactManager3 manager = ContactManager3();

  @override
  Widget build(BuildContext context) {
   return  Scaffold(
            appBar: AppBar(title: const Text("stage3 stream easy"),
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
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:32.0),
              child: IconButton(onPressed: (){
               showSearch(context: context, delegate: ContactSearchDelegate3());
              }, icon: const Icon(Icons.search)),
            ),
          
          ],
        ),
        body: StreamBuilder<List<Contact3>>(

          stream: manager.contactListNow,
          builder: (context,  AsyncSnapshot<List<Contact3>> snapshot){
         
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                case ConnectionState.active:
                  return const Center(child: CircularProgressIndicator(),);  

                case ConnectionState.done:             
            List<Contact3> contacts = snapshot.data!;
            return ListView.separated(
              padding: const EdgeInsets.only(right: 100),
              cacheExtent: 100,
              itemBuilder: (context,int index){
                Contact3 _contact = contacts[index];
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