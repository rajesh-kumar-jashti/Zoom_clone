import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zoomm_clone/resources/firestore_methods.dart';

import '../utils/colors.dart';

class HistoryMeetingScreen extends StatelessWidget {
  const HistoryMeetingScreen({super.key});


  goBack(BuildContext context){
    Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: backgroundColor,
         leading: null,
         elevation: 0,
         title: const Text('Past Meetings',style: TextStyle(fontSize: 20),),
         centerTitle: true,
         actions: const [Padding(
           padding: EdgeInsets.all(10.0),
           child: Icon(Icons.info_outline),
         )],
      ),
      body: StreamBuilder(
        stream: FirestoreMethods().meetingsHistory,
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: (snapshot.data! as dynamic).docs.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(
                'Room Name: ${(snapshot.data! as dynamic).docs[index]['meetingName']}',
              ),
              subtitle: Text(
                'Joined on ${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]['createdAt'].toDate())}',
              ),
            ),
          );
        }
      ),
    );    
  }
}