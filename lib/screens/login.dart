import 'package:flutter/material.dart';
import 'package:mychatproject/data%20models/providerclass.dart';
import 'package:mychatproject/services/firebaseauth.dart';
import 'package:mychatproject/utlities/colors.dart';
import 'package:mychatproject/widgets/loading.dart';
import 'package:mychatproject/widgets/loginbutton.dart';
import 'package:mychatproject/widgets/snackbar.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // bool loading = false;
  bool animate = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        animate = true;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    animate;
  }

  @override
  Widget build(BuildContext context) {
    snackBarLogin(String result) {
      Dialogs.showSnackBar(context, result);
      context.read<ProviderClass>().setLoading(false);
    }

    bool loading = context.watch<ProviderClass>().loading;
    mq = MediaQuery.of(context).size;
    return loading == true
        ? const Loading()
        : Scaffold(
            body: Container(
              height: mq.height * 1,
              width: mq.width * 1,
              color: backgroundColor,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    top: mq.height * 0.15,
                    left: animate ? mq.width * 0.25 : -mq.width * 0.25,
                    width: mq.width * 0.5,
                    duration: const Duration(seconds: 1),
                    child: Image.asset("assets/images/message.png"),
                  ),
                  Positioned(
                    top: mq.height * 0.72,
                    width: mq.width * 0.7,
                    left: mq.width * .15,
                    child: const Text(
                      "Welcome to My Chat App",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: themeColor,
                          textBaseline: TextBaseline.alphabetic),
                    ),
                  ),
                  Positioned(
                    bottom: mq.height * 0.15,
                    left: mq.width * 0.10,
                    width: mq.width * 0.80,
                    height: mq.height * 0.065,
                    child: LoginButton(
                      imageAddress: "assets/images/google.png",
                      text: "Google Sign In",
                      onPressed: () async {
                        // setState(() {
                        //   loading = true;
                        // });
                        context.read<ProviderClass>().setLoading(true);
                        String? result = await AuthService().signInWithGoogle();
                        snackBarLogin(result!);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
