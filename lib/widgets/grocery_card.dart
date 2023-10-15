import 'package:flutter/material.dart';

import '../screens/dtaile_screen.dart';
import '../utils/colors.dart';

class GroceryCard extends StatelessWidget {
  final String img;
  // final String area;
  // final String rate;
  final String name;
  final String land;
  final String cultivationMethod;
  final String varieties;
  final String supplement;
  final String disease;
  final String yield;
  final int index;
  const GroceryCard(
      {Key? key,
      required this.img,
      // required this.area,
      // required this.rate,
      required this.name,
      required this.land,
      required this.cultivationMethod,
      required this.varieties,
      required this.supplement,
      required this.disease,
      required this.yield,
      required this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(
                      name: name,
                      img: img,
                      // area: area,
                      // rate: rate,
                      land: land,
                      cultivationMethod: cultivationMethod,
                      varieties: varieties,
                      supplement: supplement,
                      disease: disease,
                      yield: yield,
                      index: index,
                    )));
      },
      child: Column(
        children: [
          Expanded(
            flex: 8,
            child: SizedBox(
              width: double.maxFinite,
              height: double.maxFinite,
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                  child: Hero(
                      tag: 'heroTag_$index',
                      child: Image.network(img, fit: BoxFit.fill))),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: vegitableCardclr),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Text(
                      name,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     Text(
                  //       "एकर : $area",
                  //       style: const TextStyle(
                  //           fontSize: 14, color: Colors.black54),
                  //     ),
                  //     Row(
                  //       children: [
                  //         const Icon(Icons.currency_rupee,
                  //             size: 15, color: Colors.black54),
                  //         Text(
                  //           rate,
                  //           style: TextStyle(
                  //               fontSize: 14, color: Colors.black54),
                  //         ),
                  //       ],
                  //     )
                  //   ],
                  // )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
