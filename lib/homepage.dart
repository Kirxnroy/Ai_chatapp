import 'package:flutter/material.dart';
import 'package:geminichatapp/message.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  final List<Message> _message = [
    Message(text: "hi", isUser: true),
    Message(text: "hey, sup ?", isUser: false),
    Message(text: "great, sup wit u?", isUser: true),
    Message(text: "im, good", isUser: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: _message.length,
                itemBuilder: (context, index) {
                  final message = _message[index];
                  return ListTile(
                    title: Align(
                      alignment: message.isUser
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: message.isUser
                                  ? Colors.deepPurple
                                  : Colors.grey[300],
                              borderRadius: message.isUser
                                  ? const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20))
                                  : const BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20))),
                          child: Text(
                            message.text,
                            style: TextStyle(
                                color: message.isUser
                                    ? Colors.white
                                    : Colors.black),
                          )),
                    ),
                  );
                }),
          ),

          //user input
          Padding(
            padding: const EdgeInsets.all(17),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'write your message',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20)
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.send))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
