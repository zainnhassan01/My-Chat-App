import 'package:flutter/material.dart';
import 'package:mychatproject/utlities/colors.dart';

import '../main.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final String? imageAddress;
  final IconData? icon;
  const LoginButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.imageAddress,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          minimumSize: const Size(double.infinity, 30),
          shape: const StadiumBorder()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imageAddress != null ? 
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: Image.asset(
            imageAddress!,
            height: 25,
          )) : Icon(icon) ,
          SizedBox(width: mq.width * 0.05,),
          Text(
            text,
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
