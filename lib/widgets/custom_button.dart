import 'package:flutter/material.dart';
import '../utils/colors.dart';

class CustomButtom extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  const CustomButtom({super.key, required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:80.0),
      child: ElevatedButton(
        onPressed: onPress, 
        child: Text(text,
        style: TextStyle(fontSize: 17)),
        style: ElevatedButton.styleFrom(  
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: buttonColor),
          ),
          primary: buttonColor,
          minimumSize: Size(double.infinity, 50),
        ),
      ),
    );
  }
}