import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myprofile/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _auth = FirebaseAuth.instance;
late User loggedinuser;
final _firestore = FirebaseFirestore.instance;

class ChatScreen extends StatefulWidget {
  static String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messagecontroller = TextEditingController();
  late String messagetext;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print('complete');
    });
    setState(() {
    getcurrentuser();
    });
  }

  void getcurrentuser() {
    try {
      final user = _auth.currentUser!;
      // ignore: unrelated_type_equality_checks
      if (user != Null) {
        loggedinuser = user;
        print(loggedinuser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  // void getmessages()async{
  //   final messages = await _firestore.collection('messages').get();
  //   for (var data in messages.docs){
  //     print(data.data());
  //   }
  // }

  void getstream() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var messages in snapshot.docs) {
        print(messages.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
                //Implement logout functionality
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Messagestream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messagecontroller,
                      onChanged: (value) {
                        messagetext = value;
                        //Do something with the user input.
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      messagecontroller.clear();
                      _firestore.collection('messages').add({
                        'text': messagetext,
                        'sender': loggedinuser.email,
                      });
                    },
                    //Implement send functionality.
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Messagestream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
              child: CircularProgressIndicator(backgroundColor: Colors.black));
        }
        final messages = snapshot.data!.docs.reversed;
        List<MessageBubble> messagewidgets = [];
        for (var message in messages) {
          final messagetext = message['text'];
          final messagesender = message['sender'];
          final currentuser = loggedinuser.email;

          final messagebubble = MessageBubble(text: messagetext, sender: messagesender, isMe: currentuser == messagesender);
          messagewidgets.add(messagebubble);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.all(10),
            children: messagewidgets,
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({this.sender, this.text, required this.isMe});

  final String? sender;
  final String? text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sender!,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
          Material(
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0))
                : BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
            elevation: 5.0,
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                text!,
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black54,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

