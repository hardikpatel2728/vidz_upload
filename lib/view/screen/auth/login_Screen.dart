import "package:flutter/material.dart";
import 'package:vidz_upload/view/screen/auth/signup_Screen.dart';
import 'package:vidz_upload/controller/auth_controller.dart';
import 'package:vidz_upload/view/widget/glitch.dart';
import 'package:vidz_upload/view/widget/textinputfield.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

   LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const GlithEffect(child: Text("Person Vidz",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900),)),
              const SizedBox(height: 30,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                    controller: _emailController,
                    myIcon: Icons.email,
                    myLableText: "Email"),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _passwordController,
                  myIcon: Icons.lock,
                  myLableText: "Password",
                  toHide: true,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    AuthController.instance.Login(_emailController.text, _passwordController.text);
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      child: const Text("Login"))),
              const SizedBox(height: 20,),
              ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SignupScreen();
                },));
              }, child: const Text("SignUp"))
            ],
          ),
        ),
      ),
    );
  }
}
