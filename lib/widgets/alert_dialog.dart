import 'package:flutter/material.dart';

AlertDialog alertDialog (BuildContext context,Function() press){
  return AlertDialog(
    title: const Text("खात्री करा"),
    actions: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red)
            ),
            child: const Text("रद्द करा"),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green)
            ),
            onPressed: press,
            child: const Text("पाठवा")
          )
        ],
      )
    ],
  );
}

//showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: const Text("खात्री करा"),
//           actions: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(Colors.red)
//                   ),
//                   child: const Text("रद्द करा"),
//                   onPressed: (){
//                     Navigator.pop(context);
//                   },
//                 ),
//                 ElevatedButton(
//                     style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all(Colors.green)
//                     ),
//                     onPressed: (){
//                       Navigator.pop(context);
//                     },
//                     child: const Text("पाठवा")
//                 )
//               ],
//             )
//           ],
//         ),
//       );