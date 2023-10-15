import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class TextInfo extends StatelessWidget {
  final String land;
  final String cultivation_method;
  final String varieties;
  final String supplement;
  final String disease;
  final String yield;
  const TextInfo(
      {Key? key,
      required this.land,
      required this.cultivation_method,
      required this.varieties,
      required this.supplement,
      required this.disease,
      required this.yield})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: detailCardclr,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RichText(
            textAlign: TextAlign.start,
            text: TextSpan(children: [
              const TextSpan(
                  text: "व्यवस्थापन",
                  style: TextStyle(
                      fontFamily: "Marathi",
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w600)),
              const TextSpan(
                  text: "\n\nजमीन/हवामान:\n",
                  style: descriptionHeadingTextStyle),
              TextSpan(
                  text: land.toString(),
                  style:descriptionTextStyle),
              const TextSpan(
                  text: "\n\nलागवड पध्दुत:\n",
                  style: descriptionHeadingTextStyle),
              TextSpan(
                  text: cultivation_method.toString(),
                  style: descriptionTextStyle),
              const TextSpan(
                  text: "\n\nसुधारित जाती:\n",
                  style: descriptionHeadingTextStyle),
              TextSpan(
                  text: varieties.toString(),
                  style:  descriptionTextStyle),
              const TextSpan(
                  text: "\n\nखत व पाणी व्यवस्थापन:\n",
                  style: descriptionHeadingTextStyle),
              TextSpan(
                  text: supplement,
                  style: descriptionTextStyle),
              const TextSpan(
                  text: "\n\nकिड व रोग:\n",
                  style: descriptionHeadingTextStyle),
              TextSpan(
                  text: disease,
                  style: descriptionTextStyle),
              const TextSpan(
                  text: "\n\nकाढणी व उत्पादन:\n",
                  style: descriptionHeadingTextStyle),
              TextSpan(
                  text: yield,
                  style: descriptionTextStyle)
            ])),
      ),
    );
  }
}
