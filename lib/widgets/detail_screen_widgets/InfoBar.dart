import 'package:flutter/material.dart';
import 'package:server_cyms/utils/colors.dart';

class InfoBar extends StatelessWidget {
  final String itemArea;
  final String itemRate;
  const InfoBar({Key? key, required this.itemArea, required this.itemRate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: detailCardclr,
                border:Border.all(
                    color: detailCardborderclr
                )
            ),
            child: RichText(
                text: TextSpan(children: [
                  const TextSpan(
                      text: "एकर:",
                      style: infoCardTextStyle),
                  TextSpan(
                    text: itemArea,
                    style: infoCardTextStyle,
                  ),
                ])),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: detailCardclr,
                border:Border.all(
                    color: detailCardborderclr
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                    Icons.currency_rupee,
                    size: 25, color: Colors.black
                ),
                Text(
                  itemRate,
                    style: infoCardTextStyle
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
