import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{




  static void toastMessage(String message){
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT, // or LENGTH_LONG
      gravity: ToastGravity.BOTTOM,    // TOP / CENTER / BOTTOM
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static SnackBarMessage(String msg,BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg),
      backgroundColor: Colors.yellow,)
    );
  }
}