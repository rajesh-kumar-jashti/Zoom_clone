import 'package:flutter/material.dart';
import 'package:zoomm_clone/widgets/custom_button.dart';

import '../resources/auth_methods.dart';
import '../utils/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
         title: const Text('Settings',style: TextStyle(fontSize: 20),),
         centerTitle: true,
         actions: const [Padding(
           padding: EdgeInsets.all(10.0),
           child: Icon(Icons.info_outline),
         )],
       ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: CustomButtom(
          text: 'Log Out', 
          onPress: ()=>AuthMethods().signOut(),
        ),
      ),
    );
  }
}