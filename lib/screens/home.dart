import 'package:flutter/material.dart';
import 'package:mychatproject/main.dart';
import 'package:mychatproject/services/firebaseauth.dart';
import 'package:mychatproject/utlities/colors.dart';
import 'package:mychatproject/widgets/searchbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: backgroundColor,
          height: mq.height * 1,
          width: mq.width * 1,
          child: Stack(
            children: [
              Positioned(
                left: mq.width * 0.05,
                top: mq.height * 0.05,
                width: mq.width * 0.4,
                child: const Text(
                  "Chats",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                  right: mq.width * 0.0000,
                  top: mq.height * 0.05,
                  width: mq.width * 0.25,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          size: 33,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          AuthService().signOutAccount();
                        },
                        icon: const Icon(
                          Icons.more_vert,
                          size: 33,
                        ),
                      )
                    ],
                  )),
              const SearchBarWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
