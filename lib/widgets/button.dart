import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  final Widget btnName;
  void Function() press;
  MyElevatedButton({Key? key, required this.btnName,required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 300,
      child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                  )),
              backgroundColor: const MaterialStatePropertyAll(Colors.orange)
          ),
          onPressed: press,
          child: btnName
      ),
    );
  }
}
