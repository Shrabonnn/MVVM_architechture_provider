import 'package:another_flushbar/flushbar.dart';
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
  static void flushbarErrorMessage(String msg, BuildContext context) {
    Flushbar(
      message: msg,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.red,
      margin: const EdgeInsets.all(10),
      borderRadius: BorderRadius.circular(8),
      flushbarPosition: FlushbarPosition.TOP,
      icon: const Icon(
        Icons.error,
        color: Colors.white,
      ),
    ).show(context);
  }

  static void fieldFocusChange(
      BuildContext context,
      FocusNode current,
      FocusNode next
      ){
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }
}