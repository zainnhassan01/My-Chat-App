import 'package:flutter/material.dart';
import 'package:mychatproject/data%20models/usermodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mychatproject/utlities/colors.dart';

import '../main.dart';

class UsersListTile extends StatelessWidget {
  final UserModel user;
  const UsersListTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Card(
        elevation: 0.5,
        color: backgroundColor,
        child: ListTile(
          onTap: () {},
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(mq.height * 0.05),
            child: CachedNetworkImage(
                fit: BoxFit.cover,
                height: mq.height * 0.1,
                width: mq.width * 0.14,
                imageUrl: user.image,
                errorWidget: (context, url, error) => Icon(
                      Icons.person_sharp,
                      color: Colors.grey.shade600,
                    )),
          ),
          title: Text(
            user.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(user.about, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
          // trailing: Text(u,
        ),
      ),
    );
  }
}
