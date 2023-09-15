import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  const DrawerListTile({super.key, required this.title, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Card(
        elevation: 0.1,
        child: ListTile(
          onTap: onPressed,
          title: Text(title),
          leading: Icon(icon),
        ),
      ),
    );
}
}