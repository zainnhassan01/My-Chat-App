import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 700), () {
      Navigator.pushReplacementNamed(context, "/wrapper");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset("assets/images/message.png",height: 400,width: 200,)),
          Text("My Chat",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),)
        ],
      ),
    );
  }
}