import 'package:flutter/material.dart';
import 'package:zoomm_clone/utils/colors.dart';

class MeetingOption extends StatelessWidget {
  const MeetingOption({super.key, required this.text, required this.isMute, required this.onChanged});
  final String text;
  final bool isMute;
  final Function(bool) onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: secondaryBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Switch(activeColor: buttonColor,value: isMute, onChanged: onChanged),
        ],
      ),
    );
  }
}