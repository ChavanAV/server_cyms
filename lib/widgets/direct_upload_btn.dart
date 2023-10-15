import 'package:flutter/material.dart';

import '../utils/colors.dart';

class DirectUploadBtn extends StatelessWidget {
  final Function() press;
  final Color color;
  const DirectUploadBtn({
    super.key, required this.press, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: color,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              spreadRadius: 1,
              blurStyle: BlurStyle.normal
            )
          ],
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: detailCardborderclr)),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: press,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text("Send Info",
                  style: infoCardTextStyle),
              Icon(Icons.file_upload_outlined,
                  size: 20, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}