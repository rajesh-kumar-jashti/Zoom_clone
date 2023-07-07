import 'package:flutter/material.dart';
import 'package:jitsi_meet_v1/feature_flag/feature_flag.dart';
import 'package:jitsi_meet_v1/jitsi_meet.dart';
import 'package:zoomm_clone/resources/auth_methods.dart';
import 'package:zoomm_clone/resources/firestore_methods.dart';

class JitsiMeetMethods{
  final AuthMethods _authMethods = AuthMethods();
  final FirestoreMethods _firestoreMethods= FirestoreMethods();

  void createNewMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username='',
  }) async{
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled=false;
      featureFlag.resolution=FeatureFlagVideoResolution.HD_RESOLUTION;
      
      String name;
      if(username.isEmpty){
        name=_authMethods.user.displayName!;
      }
      else{
        name=username;
      }
      var options = JitsiMeetingOptions(
        room: roomName
      )
        ..userDisplayName = name
        ..userEmail = _authMethods.user.email
        ..userAvatarURL = _authMethods.user.photoURL
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;

      _firestoreMethods.addToMeetingHistory(roomName);
      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      print("error: $error");
      
    }
  }
}