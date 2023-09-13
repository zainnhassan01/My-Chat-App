import 'package:flutter/material.dart';
import 'package:mychatproject/utlities/colors.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final String imageAddress;
  LoginButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.imageAddress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          minimumSize: Size(double.infinity, 30),
          shape: StadiumBorder()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: Image.asset(
            imageAddress,
            height: 25,
          )),
          Text(
            text,
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
