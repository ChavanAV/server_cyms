import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {

  void toastMsg(String errorMsg){
    Fluttertoast.showToast(
        msg: errorMsg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.greenAccent.shade200,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  void dialog(BuildContext context){
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        scrollable: true,
        backgroundColor: Colors.blue.shade50,
        title: const Text("My Profile"),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("assets/images/background.jpg"),
                ),
              ],
            ),
            Row(
              children: const [
                Text("Name : "),
                Text("widget.username"),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                Text("Phone : "),
                Expanded(child: Text("widget.phone")),
              ],
            ),
          ],
        ),
      );
    },);
  }

 }