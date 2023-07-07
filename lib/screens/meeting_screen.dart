
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoomm_clone/resources/jitsi_meet_methods.dart';
import '../utils/colors.dart';
import '../widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({Key? key}) : super(key: key);

  final JitsiMeetMethods _jitsiMeetMethods=JitsiMeetMethods();
  createNewMeeting()async{
    var random = Random();
    String roomName = (random.nextInt(10000000)+ 10000000).toString();
    _jitsiMeetMethods.createNewMeeting(roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting(BuildContext context){
    Navigator.pushNamed(context, '/video-call');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
         backgroundColor: backgroundColor,
         leading: null,
         elevation: 0,
         title: const Text('Meetings',style: TextStyle(fontSize: 20),),
         centerTitle: true,
         actions: const [Padding(
           padding: EdgeInsets.all(10.0),
           child: Icon(Icons.info_outline),
         )],
       ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NewMeetingButton(
                  onPressed: createNewMeeting,
                  text: 'New Meeting',
                  icon: Icons.videocam_rounded,
                ),
                HomeMeetingButton(
                  onPressed: ()=> joinMeeting(context),
                  text: 'Join Meeting',
                  icon: Icons.add_box_rounded,
                ),
                HomeMeetingButton(
                  onPressed: () {},
                  text: 'Schedule',
                  icon: Icons.calendar_today,
                ),
                HomeMeetingButton(
                  onPressed: () {},
                  text: 'Share Screen',
                  icon: Icons.arrow_upward_rounded,
                ),
              ],
            ),
            const Expanded(
              child: Center(
                child: Text(
                  'Create/Join Meetings',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}