import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mychatproject/data%20models/usermodel.dart';
import 'package:mychatproject/services/firebasefirestore.dart';
import 'package:mychatproject/widgets/loginbutton.dart';
import 'package:mychatproject/widgets/snackbar.dart';
import 'package:provider/provider.dart';
import '../data models/providerclass.dart';
import '../main.dart';
import '../utlities/colors.dart';

class AccountScreen extends StatelessWidget {
  final UserModel user;
  AccountScreen({super.key, required this.user});
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  void updateButton(BuildContext context , String message){
    Dialogs.showSnackBar(context, message);
    context.read<ProviderClass>().setName("");
    context.read<ProviderClass>().setAbout("");

  }
  @override
  Widget build(BuildContext context) {
    String name = context.watch<ProviderClass>().name;
    String about = context.watch<ProviderClass>().about;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            height: mq.height * 1,
            width: mq.width * 1,
            child: Stack(
              children: [
                Positioned(
                  top: mq.height * 0.018,
                  left: mq.width * 0.02,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                ),
                Positioned(
                  top: mq.height * 0.027,
                  left: mq.width * 0.2,
                  child: const Text(
                    "Edit Profile",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                  top: mq.height * 0.1,
                  left: mq.width * 0.05,
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          Stack(children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(mq.height * 0.12),
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                height: mq.height * 0.23,
                                width: mq.width * 0.5,
                                imageUrl: user.image,
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.person_sharp),
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                height: mq.height * 0.05,
                                width: mq.height * 0.05,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Container(
                                    color: themeColor,
                                    child: IconButton(
                                      splashColor: themeColor,
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ))
                          ]),
                          SizedBox(
                            height: mq.height * 0.025,
                            width: mq.width * 0.5,
                          ),
                          SizedBox(
                            width: mq.width * 0.5,
                            child: Text(
                              user.email,
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: mq.height * 0.03,
                            width: mq.width * 0.5,
                          ),
                          SizedBox(
                            height: mq.height * 0.12,
                            width: mq.width * 0.9,
                            child: TextFormField(
                              onChanged: (value) => {
                                context.read<ProviderClass>().setName(value)
                              },
                              initialValue: user.name,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.shade300,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: themeColor, width: 1),
                                ),
                                hintText: "Username",
                                label: const Text(
                                  "Name",
                                  style: TextStyle(fontSize: 18),
                                ),
                                prefixIcon: const Icon(Icons.person_sharp),
                                prefixIconColor: Colors.black,
                              ),
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            height: mq.height * 0.12,
                            width: mq.width * 0.9,
                            child: TextFormField(
                              onChanged: (value) => {
                                context.read<ProviderClass>().setAbout(value)
                              },
                              initialValue: user.about,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.shade300,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: themeColor),
                                ),
                                hintText: "Add About!",
                                label: const Text(
                                  "About",
                                  style: TextStyle(fontSize: 18),
                                ),
                                prefixIcon: const Icon(Icons.lock),
                                prefixIconColor: Colors.black,
                              ),
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                          SizedBox(
                              height: mq.height * 0.05,
                              width: mq.width * 0.7,
                              child: LoginButton(
                                text: "Update",
                                onPressed: () async {
                                  String message = await FireStoreClass().updataUserInfo(name, about);
                                  updateButton(context,message);
                                },
                                icon: Icons.edit,
                              ))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
