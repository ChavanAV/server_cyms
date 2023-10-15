import 'package:flutter/material.dart';
import 'package:server_cyms/model/grocery_list.dart';
import 'package:server_cyms/screens/info_send_screen.dart';
import 'package:server_cyms/utils/drawer.dart';

import '../utils/colors.dart';
import '../utils/my_app_bar.dart';
import '../widgets/home_list_tile.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  List<GroceryList> gList = groceryList;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: drawer(context),
        appBar: MyAppBar().myHomeAppbar(() => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const SendInfoScreen(
                      fromDirectScreen: 'yes',
                    )))),
        backgroundColor: bgclr,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Container()),
            Expanded(
              flex: 2,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: gList.length,
                itemBuilder: (context, index) =>
                    HomeListTile(gList: gList, index: index),
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
