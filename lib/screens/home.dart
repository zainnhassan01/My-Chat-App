  import 'package:cloud_firestore/cloud_firestore.dart';
  import 'package:flutter/material.dart';
  import 'package:mychatproject/data%20models/usermodel.dart';
  import 'package:mychatproject/main.dart';
  import 'package:mychatproject/screens/accountscreen.dart';
  import 'package:mychatproject/services/firebasefirestore.dart';
  import 'package:mychatproject/utlities/colors.dart';
  import 'package:mychatproject/widgets/drawer.dart';
  import 'package:mychatproject/widgets/list_tile_homescreen.dart';
  import 'package:mychatproject/widgets/loading.dart';
  import 'package:mychatproject/widgets/searchbar.dart';
  import 'package:provider/provider.dart';
  import '../data models/providerclass.dart';

  class Home extends StatefulWidget {
    Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
    List<UserModel> userdata = [];

    final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

    Future setdata(BuildContext context,List<UserModel> userData) async {
      Future.delayed(const Duration(seconds: 2), (){
        Provider.of<ProviderClass>(context,listen: false).setsearchList(userData);
      });
    }

    void _openDrawer() {
      _scaffoldkey.currentState!.openDrawer();
    }
  @override
  void initState() {
    
   FireStoreClass().getPersonalInfo(context);
    super.initState();
  }
    @override
    Widget build(BuildContext context) {
      return GestureDetector(
        onTap:() => FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: _scaffoldkey,
          drawer: DrawerWidget(),
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
                            onPressed: () {
                              _openDrawer();
                            },
                            icon: const Icon(
                              Icons.add,
                              size: 33,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                            },
                            icon: const Icon(
                              Icons.more_vert,
                              size: 33,
                            ),
                          )
                        ],
                      )),
                  const SearchBarWidget(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, mq.height * 0.2, 0, 0),
                    child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                      stream: FireStoreClass().userLists,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting ||
                            snapshot.connectionState == ConnectionState.none) {
                          return const Loading();
                        }
                        if (snapshot.hasData) {
                          final data = snapshot.data!.docs;
                          userdata = data
                              .map((e) => UserModel.fromJson(e.data()))
                              .toList();
                          setdata(context,userdata);
                          print(userdata);
                          return ListView.builder(
                            itemCount: userdata.length,
                            itemBuilder: (context, index) =>
                                UsersListTile(user: userdata[index]),
                          );
                        } else {
                          return const Center(
                            child: Text('No Users Found'),
                          );
                        }
                      },
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
