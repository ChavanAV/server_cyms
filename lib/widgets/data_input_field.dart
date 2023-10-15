import 'package:flutter/material.dart';

import '../utils/colors.dart';

class DataInput extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  DataInput({Key? key,required this.labelText, required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
        keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: labelText,
        labelStyle: labelTextStyle,
      ),
      validator: (val){
        if(val!.isEmpty){
          return labelText;
        }else{
          return null;
        }
      },
      cursorHeight: 25,
      cursorColor: Colors.green,
    );
  }
}