import 'package:flutter/material.dart';
import 'package:flutter_stream_search/pages/stage3/contact_model.dart';



class ContactListBuilder extends StatelessWidget {
  final Stream<List<Contact>> stream;
  final Function builder;
  const ContactListBuilder({Key? key, required this.stream, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<List<Contact>>(

          stream: stream,
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