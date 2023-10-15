import 'dart:async';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {

  void initState(){
    super.initState();
    isLogin();
  }
  void isLogin() async {
      Timer(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(
            builder: (context)=> HomeScreen(),
        ));
      });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.withOpacity(.3),
    );
  }
}
