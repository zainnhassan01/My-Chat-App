import 'package:flutter/material.dart';
import 'package:mychatproject/data%20models/usermodel.dart';
import 'package:mychatproject/screens/home.dart';
import 'package:mychatproject/screens/login.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final UserStreamDataModel? user = Provider.of<UserStreamDataModel?>(context);
    print(user);
    if(user == null) {
      return const Login();
    }
    return const Home();
  }
}