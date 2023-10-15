import 'package:flutter/material.dart';
import 'package:server_cyms/utils/toast_msg.dart';

Drawer drawer(BuildContext context)  {
  return Drawer(
  backgroundColor: Colors.blue.shade50,
  elevation: 10,
  width: 250,
  child: ListView(
      children: [
        UserAccountsDrawerHeader(
          accountName: const Text("Hello A !",style:TextStyle(color: Colors.black),),
          accountEmail: null,
          currentAccountPicture: const CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage("assets/images/background.jpg"),
          ),
          decoration: BoxDecoration(
            color: Colors.green.shade200,
          ),
          margin: EdgeInsets.zero,
        ),
        ListTile(
          onTap: () {
            Utils().dialog(context);
          },
          leading: const Icon(Icons.person),
          title: const Text("My Profile"),
        ),
        ListTile(
          onTap: () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) =>const  MyAppInfo()));
          },
          leading: const Icon(Icons.privacy_tip_outlined),
          title: const Text("Privacy"),
          shape: const Border(
              top: BorderSide(color: Colors.black12)
          ),
        ),
        const ListTile(
          // onTap: onLogOut,
          leading: Icon(Icons.logout),
          title: Text("Log Out"),
          shape: Border(
              top: BorderSide(color: Colors.black12),
              bottom:BorderSide(color: Colors.black12)
          ),
        ),
      ]),
);
}