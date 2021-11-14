import 'package:flutter/material.dart';
import 'package:flutter_stream_search/pages/stage1/contact_manager.dart';



class Stage1 extends StatelessWidget {
   Stage1({Key? key}) : super(key: key);
ContactManager manager = ContactManager();

  @override
  Widget build(BuildContext context) {
    return      Scaffold(appBar: AppBar(title: const Text("stage1 stream easy"),
       leading:   Chip(
             label: StreamBuilder<int>(
             stream: manager.contactCounter,
             builder: (context,snapshot){
               return   Text(
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
        body: StreamBuilder<List<String>>(
          stream: manager.contactListNow,
          builder: (context,snapshot){
            if(snapshot.hasData){

            List<String> contacts = snapshot.data!;
            return ListView.separated(
              padding: const EdgeInsets.only(right: 100),
              cacheExtent: 100,
              itemBuilder: (context,int index){
                return ListTile(title: Text(contacts[index]));
              },
               separatorBuilder: (context, indext)=>const  Divider(),
                itemCount: contacts.length );
          }
        
          return const  CircularProgressIndicator();
          }
              ),       
    );
    
  }
}