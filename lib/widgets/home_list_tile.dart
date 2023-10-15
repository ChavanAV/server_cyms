import 'package:flutter/material.dart';
import 'package:server_cyms/screens/crop_screen.dart';

import '../model/grocery_list.dart';

class HomeListTile extends StatelessWidget {
  final List<GroceryList> gList;
  final int index;

  const HomeListTile({
    super.key,
    required this.gList,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(gList[index].name),
        radius: 40,
      ),
      title: Text(
        gList[index].description!,
        style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
      ),
      minVerticalPadding: 30,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CropsScreen(
                      index: index,
                      allCropName: gList[index].description!,
                    )));
      },
    );
  }
}
