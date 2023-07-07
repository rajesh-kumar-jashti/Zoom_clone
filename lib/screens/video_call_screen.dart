import 'package:flutter/material.dart';
import 'package:jitsi_meet_v1/jitsi_meet.dart';
import 'package:zoomm_clone/resources/auth_methods.dart';
import 'package:zoomm_clone/resources/jitsi_meet_methods.dart';
import 'package:zoomm_clone/utils/colors.dart';
import 'package:zoomm_clone/widgets/meeting_option.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AuthMethods _authMethods= AuthMethods();
  late TextEditingController meetingIdController;
  late TextEditingController nameController;
  final JitsiMeetMethods _jitsiMeetMethods=JitsiMeetMethods();
  bool isAudioMuted =true;
  bool isVideoMuted =true;

  @override 
  void initState() {
    meetingIdController=TextEditingController();
    nameController=TextEditingController(text: _authMethods.user.displayName);
    super.initState();
  }

  @override
  void dispose()
  {
    super.dispose();
    meetingIdController.dispose();
    nameController.dispose();
    JitsiMeet.removeAllListeners();
  }

  _joinMeeting(){
    _jitsiMeetMethods.createNewMeeting(
      roomName: meetingIdController.text, 
      isAudioMuted: isAudioMuted, 
      isVideoMuted: isVideoMuted,
      username: nameController.text,
    );
  }

  goBack(BuildContext context){
    Navigator.pushNamed(context, '/home');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: ()=>goBack(context),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.lightBlue,
          ),
        ),
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          'Join a Meeting',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              height: 60,
              width: double.infinity,
              child: TextField(
                controller: meetingIdController,
                maxLines: 1,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Room ID',
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:15.0),
            child: SizedBox(
              height: 60,
              child: TextField(
                controller: nameController,
                maxLines: 1,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Name',
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10,),
          InkWell(
            onTap: _joinMeeting,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: const BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                width: double.infinity,
                height: 45,
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Center(
                    child: Text('Join',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700
                    ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              SizedBox(width: 12),
              Text(
                'JOIN OPTIONS',
                style: TextStyle(
                  color: Colors.grey
                  ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          MeetingOption(
            text: "Don't Connect To Audio",
            isMute: isAudioMuted,
            onChanged: onAudioMuted,
          ),
          MeetingOption(
            text: "Turn Off My Video",
            isMute: isVideoMuted,
            onChanged: onVideoMuted,
          ),
        ],
      ),
    );
  }
  onAudioMuted(bool val){
    setState(() {
      isAudioMuted=val;
    });
  }
  onVideoMuted(bool val){
    setState(() {
      isVideoMuted=val;
    });
  }

}