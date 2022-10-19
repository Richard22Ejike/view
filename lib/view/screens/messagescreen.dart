import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'chatscreen.dart';




class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);



  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('users')
              .where(
            'username',

          )
              .get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: (snapshot.data! as dynamic).docs.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ChatDetail(
                        uid: (snapshot.data! as dynamic).docs[index]['uid'],
                        friendName :
                        (snapshot.data! as dynamic).docs[index]['name'],
                      ),
                    ),
                  ),     child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      (snapshot.data! as dynamic).docs[index]['profilePhoto'],
                    ),
                    radius: 16,
                  ),
                  title: Text(
                    (snapshot.data! as dynamic).docs[index]['name'],
                  ),
                ),
                );
              },
            );
          },
        )

    );
  }


}
