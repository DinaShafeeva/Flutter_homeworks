import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';
import 'dart:developer' as developer;
import 'chat_store.dart';

class SecondHomework extends StatefulWidget {
  const SecondHomework({Key? key}) : super(key: key);

  final String title = "Second homework";

  @override
  _SecondHomeworkState createState() => _SecondHomeworkState();
}

class _SecondHomeworkState extends State<SecondHomework> {
  ChatStore _chatStore = ChatStore();

  List<String> messages = ['Hi, how are you?', 'Hi!'];
  final messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _chatStore.fetchChat();
    developer.log('log me', name: 'chat');
  }
  //
  //
  // @override
  // void dispose() {
  //   messageController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat',
      home: MultiProvider(
        providers: [
          Provider<ChatStore>(create: (_) => ChatStore())
        ],
     // ),
     // appBar: AppBar(title: Text(widget.title),),
     // body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Observer(builder: (context) {
                 return ListView(
                   children: context.watch<ChatStore>().chat.map((item) {
                   //_chatStore.chat.map((item) {
                  return ListTile(
                    title: Text(item.message)
                      .textColor(Colors.blueAccent)
                      .fontSize(16)
                      .fontWeight(FontWeight.bold),
                      onTap: () {
                    // setState(() {
                    //   scale = 1.2;
                    // });
                  //  Modular.to.pushNamed('/detail/${item.id}');
                  },
                     );
                   }).toList(),
                  );
                },
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TextField(
            //     controller: messageController,
            //     onChanged: (value) {
            //
            //     },
            //     // controller: editingController,
            //     decoration: InputDecoration(
            //         labelText: "Your message",
            //         hintText: "Your message",
            //         suffixIcon: IconButton (
            //           icon: Icon(Icons.send),
            //           onPressed: _addMessage,
            //         ),
            //         border: OutlineInputBorder(
            //             borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  void _addMessage() {
    setState(() {
      messages.add(messageController.text);
      messageController.clear();
    });
  }
}

