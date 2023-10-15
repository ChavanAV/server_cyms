import 'package:flutter/material.dart';
import 'package:server_cyms/auth/signup_screen.dart';
import 'package:server_cyms/screens/home_screen.dart';
import 'package:server_cyms/widgets/button.dart';
import 'package:server_cyms/widgets/data_input_field.dart';

class LoginPage extends StatelessWidget {
   LoginPage({Key? key}) : super(key: key);
  final passcntrl = TextEditingController();
  final usernamecntrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Container()),
              DataInput(controller: usernamecntrl,labelText: "Enter user name"),
              const SizedBox(
                height: 40,
              ),
              DataInput(labelText: "Enter password", controller: passcntrl,),
              const SizedBox(
                height: 40,
              ),
              MyElevatedButton(
                  btnName: const Text("Login",style: TextStyle(fontSize: 22),),
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => HomeScreen()));
                  }, ),
              Expanded(child: Container()),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account ?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  SignUpScreen()));
                      },
                      child: const Text("SignUp")),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
