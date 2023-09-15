import 'package:flutter/material.dart';

import '../utlities/colors.dart';

class Dialogs {

  static void showSnackBar(BuildContext context,String message){
    try{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        // duration: const Duration(milliseconds: 700),
        backgroundColor: themeColor.withOpacity(0.8),
        elevation: 0.0,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ));
    } catch(e) {
      print(e);
    }
     
  }
}