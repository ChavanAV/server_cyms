import 'package:flutter/material.dart';

import '../widgets/appBar_leading_btn.dart';
import 'colors.dart';

class MyAppBar {
  AppBar myHomeAppbar(Function() press) {
    return AppBar(
      leading: Builder(
        builder: (context) => AppBarLeadingBTN(
          icon: const CircleAvatar(
            backgroundImage: AssetImage("assets/images/background.jpg"),
          ),
          // press: () => Scaffold.of(context).openDrawer(),
          press: () {},
        ),
      ),
      title: const Text("पिक नियंत्रण",
          style: TextStyle(fontSize: 25, color: Colors.black)),
      backgroundColor: Colors.transparent,
      elevation: 0,
      // actions: [
      //   DirectUploadBtn(press: press,color: detailCardclr,)
      // ],
    );
  }

  AppBar myAppBar(String appBarName) {
    return AppBar(
      leading: Builder(
          builder: (context) => AppBarLeadingBTN(
                icon: const Icon(
                  Icons.arrow_back,
                  color: backIconclr,
                  size: 30,
                ),
                press: () {
                  Navigator.pop(context);
                },
              )),
      elevation: 0,
      backgroundColor: appBarclr,
      title: Text(appBarName, style: appBarTitleStyle),
      centerTitle: true,
    );
  }
}
