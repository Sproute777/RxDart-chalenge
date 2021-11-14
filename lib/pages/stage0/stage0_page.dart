import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';


class Stage0 extends StatefulWidget {
  Stage0({Key? key}) : super(key: key);

  @override
  _Stage0State createState() => _Stage0State();
}

class _Stage0State extends State<Stage0> {
 var messages = const [];

Future loadMessageList() async{
  var content = await rootBundle.loadString('data/messages.json');
  var collection = json.decode(content);
  setState(() {
    messages = collection;
  });
  // print(content);
 
}

@override
void initState(){
  loadMessageList();
  super.initState();
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("flutter demo"),),
        body: ListView.separated(
            itemCount: messages.length,
          itemBuilder: (context,int index){
            var message = messages[index];
            return ListTile(
              title: Text(message["subject"]),
              isThreeLine: true,
              leading: const CircleAvatar(
                child: Text("RootBundle loading"),
              ),
              subtitle: Text(
                message["body"],
                maxLines:2,
                overflow: TextOverflow.ellipsis,
              ),
            );
          },
           separatorBuilder:(context, index)=> const Divider(),
            )
      )
    );
  }
}