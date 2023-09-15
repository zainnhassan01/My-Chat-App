import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mychatproject/data%20models/usermodel.dart';
import 'package:mychatproject/screens/accountscreen.dart';
import 'package:mychatproject/services/firebaseauth.dart';
import 'package:mychatproject/utlities/colors.dart';
import 'package:mychatproject/widgets/drawerlisttile.dart';
import 'package:provider/provider.dart';

import '../data models/providerclass.dart';
import '../main.dart';

class DrawerWidget extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
      UserModel? personalUser = context.watch<ProviderClass>().personalUser;
    return Drawer(
      width: mq.width * 0.7,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: mq.width * 0.7,
                height: mq.height * 0.21,
                color: themeColor,
               ),
              Positioned(
                  width: mq.width * 0.5,
                  top: mq.height * 0.1,
                  left: mq.width * 0.06,
                  child: Text(
                    personalUser!.name,
                    style: const TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color: Colors.white),
                  ),),
                  Positioned(
                  width: mq.width * 0.7,
                  top: mq.height * 0.15,
                  left: mq.width * 0.06,
                  child: Text(
                    personalUser.email,
                    style: const TextStyle(fontSize: 18,color: Colors.white,fontStyle: FontStyle.italic),
                  ),),
                  Positioned(
                  width: mq.width * 0.9,
                  top: mq.height * 0.2,
                  // left: mq.width * 0.06,
                  child: const Divider(color: Colors.black,)
                  ),
            ],
          ),
           DrawerListTile(title: "Edit Profile", icon: Icons.edit,onPressed: () => {
            
            Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AccountScreen(user: personalUser!),
                      ))
           },),
          DrawerListTile(title: "Log Out", icon: Icons.logout,onPressed: () {
            AuthService().signOutAccount();
          },)
        ],
      ),
    );
  }
}
