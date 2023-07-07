import 'package:flutter/material.dart';

import '../utils/colors.dart';

class Contacts extends StatelessWidget {
  const Contacts({super.key});

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
         title: const Text('Contacts',style: TextStyle(fontSize: 20),),
         centerTitle: true,
         actions: const [Padding(
           padding: EdgeInsets.all(10.0),
           child: Icon(Icons.info_outline),
         )],
       ),
      body: const Center(
        child: Text(
          'Contacts',
          style: TextStyle(
            fontSize: 18
          ),
        ),
      )
    );
  }
}