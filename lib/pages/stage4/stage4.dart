 import 'package:flutter/material.dart';
import 'package:flutter_stream_search/pages/stage4/contact_counter.dart';
import 'package:flutter_stream_search/pages/stage4/contact_list_builder.dart';
import 'package:flutter_stream_search/pages/stage4/contact_model.dart';
import 'package:flutter_stream_search/pages/stage4/contact_manager.dart';
import 'package:flutter_stream_search/pages/stage4/contact_search.dart';
import 'package:flutter_stream_search/pages/stage4/provider_inherited.dart';

void main(){
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      data: ContactManager(),
      child: MaterialApp(
              home: Stage4()
      ),
    );
  }
}




class Stage4 extends StatelessWidget {
  Stage4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

   return  Scaffold(
            appBar: AppBar(title: const Text("stage4 stream easy"),
               leading:  ContactCounter(),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:32.0),
              child: IconButton(onPressed: (){
               showSearch(context: context, delegate: ContactSearchDelegate());
              }, icon: const Icon(Icons.search)),
            ),
          
          ],
        ),
        body: ContactListBuilder(
          builder: (context,  List<Contact> snapshot){             
            List<Contact> contacts = snapshot;
            return ListView.separated(
              padding: const EdgeInsets.only(right: 100),
              cacheExtent: 100,
              itemBuilder: (context,int index){
                Contact _contact = contacts[index];
                return ListTile(
                  title: Text(_contact.name),
                  subtitle: Text(_contact.email),             
                );
              },
               separatorBuilder: (context, indext)=>const  Divider(),
                itemCount: contacts.length );
          } 
           ),      
    );
  }
}

