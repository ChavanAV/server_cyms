import 'package:flutter/material.dart';
import 'package:server_cyms/widgets/button.dart';
import 'package:server_cyms/widgets/data_input_field.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({Key? key}) : super(key: key);
  final passcntrl = TextEditingController();
  final usernamecntrl = TextEditingController();
  final phonecntrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back,color: Colors.black,)),
      ),
      body: Center(
        child: Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DataInput(controller: usernamecntrl,labelText: "Enter user name"),
                  const SizedBox(height: 20,),
                  DataInput(controller: phonecntrl,labelText: "Enter mobile number"),
                  const SizedBox(height: 20,),
                  DataInput(controller: passcntrl,labelText: "Set password"),
                  const SizedBox(height: 20,),
                  MyElevatedButton(btnName: const Text("SignUp",style: TextStyle(fontSize: 22),), press: ()=>Navigator.pop(context))
                ],
              ),
            )
        ),
      ),
    );
  }
}
