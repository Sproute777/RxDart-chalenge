import 'package:flutter/material.dart';
import 'package:flutter_stream_search/pages/stage3/contact3.dart';



class Contact3ListBuilder extends StatelessWidget {
  final Stream<List<Contact3>> stream;
  final Function builder;
  const Contact3ListBuilder({Key? key, required this.stream, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<List<Contact3>>(

          stream: stream,
          builder: (context,  AsyncSnapshot<List<Contact3>> snapshot){
         
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                case ConnectionState.active:
                  return const Center(child: CircularProgressIndicator(),);  

                case ConnectionState.done:             
            List<Contact3> contacts = snapshot.data!;
            return builder(context, contacts);
          } }
           );    
  }
}