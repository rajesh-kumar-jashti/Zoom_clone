import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zoomm_clone/resources/auth_methods.dart';
import 'package:zoomm_clone/screens/contacts_screen.dart';
import 'package:zoomm_clone/screens/settings_screen.dart';
import 'package:zoomm_clone/widgets/custom_button.dart';

import '../utils/colors.dart';
import 'history_meeting_screen.dart';
import 'meeting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    MeetingScreen(),
    const HistoryMeetingScreen(),
    Contacts(),
    SettingsScreen(),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: SizedBox(
        height: 65,
        child: BottomNavigationBar(
          backgroundColor: footerColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          onTap: onPageChanged,
          currentIndex: _page,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.comment_bank,
              ),
              icon: Icon(
                Icons.comment_bank_outlined,
              ),
              label: 'Meet & Chat',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.videocam_rounded,
              ),
              icon: Icon(
                Icons.videocam_outlined,
              ),
              label: 'Meetings',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.person,
              ),
              icon: Icon(
                Icons.person_outline,
              ),
              label: 'Contacts',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_outlined,
              ),
              activeIcon: Icon(
                Icons.settings,
              ),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}