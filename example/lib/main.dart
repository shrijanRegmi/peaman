import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:peaman/peaman.dart';

void main() async {
  runApp(ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snap) {
        if (snap.hasData) {
          return MaterialApp(
            title: 'Example App',
            debugShowCheckedModeBanner: false,
            home: Material(
              child: HomeScreen(),
            ),
          );
        }
        return Container();
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Example App"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              MaterialButton(
                onPressed: () async {
                  final _message = PeamanMessage(
                    id: null,
                    chatId: 'test_chat_id',
                    text: 'new message more',
                    senderId: 'shrijan_regmi',
                    receiverId: 'ram_bahadur',
                    updatedAt: DateTime.now().millisecondsSinceEpoch,
                    type: PeamanMessageType.text,
                  );

                  await PChatProvider.sendMessage(
                    message: _message,
                  );
                },
                color: Colors.deepPurple,
                child: Text("Send Message"),
                textColor: Colors.white,
              ),
              SizedBox(
                height: 20.0,
              ),
              _messagesDisplay(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _messagesDisplay() {
    return Expanded(
      child: StreamBuilder<List<PeamanMessage>>(
        stream: PChatProvider.getMessages(chatId: 'test_chat_id'),
        builder: (context, snap) {
          if (snap.hasData) {
            final _messages = snap.data;

            return ListView.builder(
              itemCount: _messages?.length,
              itemBuilder: (context, index) {
                final _message = _messages![index];
                return ListTile(
                  leading: Icon(Icons.message),
                  title: Text(_message.text ?? ''),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
